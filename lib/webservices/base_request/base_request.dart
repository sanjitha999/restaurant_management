import 'package:http/http.dart' as http;
import 'package:resturant_management/auth/auth_manager.dart';
import 'package:resturant_management/session/session_manager.dart';
import 'package:resturant_management/webservices/base_request/constants.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

enum HttpMethod { get, post, put, delete }

class BaseRequest {
  bool? authenticated;
  late Uri url;
  HttpMethod? method;
  dynamic body;
  Map<String, String>? headers;
  int retryCount = 0;

  BaseRequest({
    this.authenticated,
    required this.url,
    required this.method,
    this.body,
    this.headers,
  });
}

mixin WebserviceUtils {
  Future<http.Response?> constructAndExecuteRequest({
    HttpMethod? method,
    required String endpoint,
    bool? authenticated,
    dynamic body,
    Map<String, String>? queryParams,
    Map<String, String>? additionalHeaders,
  }) async {
    final BaseRequest request = await constructRequest(
      method: method,
      endpoint: endpoint,
      authenticated: authenticated,
      body: body,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );
    if (request.headers == null) return null;

    return executeRequest(request, additionalHeaders: additionalHeaders);

  }

  Future<BaseRequest> constructRequest({
    HttpMethod? method,
    required String endpoint,
    bool? authenticated,
    dynamic body,
    Map<String, String>? queryParams,
    Map<String, String>? additionalHeaders,
  }) async {
    return BaseRequest(
      authenticated: authenticated,
      url: Uri.https(_getBaseUrl(), endpoint, queryParams),
      method: method,
      headers: await getRequestHeaders(
        authenticated: authenticated,
        additionalHeaders: additionalHeaders,
      ),
      body: body,
    );
  }

  Future<http.Response?> executeRequest(
      BaseRequest request, {
        Map<String, String>? additionalHeaders,
      }) async {
    http.Response? response;
    switch (request.method) {
      case HttpMethod.get:
        response = await http.get(
          request.url,
          headers: request.headers,
        );
        break;

      case HttpMethod.post:
        response = await http.post(
          request.url,
          headers: request.headers,
          body: request.body,
        );
        break;

      case HttpMethod.put:
        response = await http.put(
          request.url,
          headers: request.headers,
          body: request.body,
        );
        break;

      case HttpMethod.delete:
        response = await http.delete(
          request.url,
          headers: request.headers,
        );
        break;

      default:
        break;
    }

    if (response?.statusCode == 401 && request.retryCount <= 0) {
      final String? accessToken = await AuthManager().refreshAuthToken();
      if (accessToken == null) {
        await SessionManager().initiateLogout();
        return null;
      } else {
        request.headers = await getRequestHeaders(
          authenticated: request.authenticated ?? false,
          additionalHeaders: additionalHeaders,
        );
        request.retryCount++;
        return executeRequest(request, additionalHeaders: additionalHeaders,);
      }
    } else {
      return response;
    }
  }

  Future<Map<String, String>?> getRequestHeaders({
    required bool? authenticated,
    String contentType = Header.contentTypeJson,
    Map<String, String>? additionalHeaders,
  }) async {
    if (authenticated ?? false) {
      final accessToken = await getAccessToken();
      if (accessToken == null) {
        await SessionManager().initiateLogout();
        return null;
      }
    }

    final Map<String, String> defaultHeaders = {
      if (authenticated ?? false)
        Header.authorization: (await getAccessToken()) ?? "",
      Header.contentType: Header.contentTypeJson,
    };
    // if (null != additionalHeaders) defaultHeaders.addAll(additionalHeaders);
    return defaultHeaders;
  }

  Future<String?> getAccessToken() async {
    return AuthManager().getAuthToken();
  }

  String _getBaseUrl() {
    return Uri.parse(EndPoints.baseUrl).host;
  }
}
