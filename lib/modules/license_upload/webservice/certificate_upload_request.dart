import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/license_upload/model/license_item_model.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class CertificateUploadRequest with WebserviceUtils {
  Future<void> uploadCertificates({
    required List<LicenseItemModel> certificates,
    required String id,
  }) async {
    List<http.MultipartFile> files =
        await _generateMultipartFiles(certificates);
    http.MultipartRequest request = await constructMultipartRequest(
      method: HttpMethod.post, // Assuming HttpMethod is defined elsewhere
      endpoint: '${EndPoints.certificateUpload}/$id',
      files: files,
      authenticated: true,
    );
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        //Upload successful
      } else {
        throw Exception("Failed to upload: ${response.reasonPhrase}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<http.MultipartFile>> _generateMultipartFiles(
      List<LicenseItemModel> licenses) async {
    List<http.MultipartFile> files = [];

    for (var license in licenses) {
      if (license.licenseFile != null) {
        // Check if the file is available
        // Create the upload name using the enum value and a unique identifier
        String uploadName =
            '${license.licenseCertificate}_${license.certificateId}';

        // Add MultipartFile to the list
        files.add(await http.MultipartFile.fromPath(
            uploadName, license.licenseFile!.path));
      }
    }

    return files;
  }
}
