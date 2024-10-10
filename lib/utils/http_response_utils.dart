import 'package:http/http.dart';

extension ResponseExtension on Response {
  bool isSuccessful() => statusCode == 200;

  bool notModified() => statusCode == 304;

  bool isError() => statusCode >= 400;

  bool isCustomError() => statusCode == 477;
}