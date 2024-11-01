import 'package:resturant_management/modules/license_upload/model/license_item_model.dart';
import 'package:resturant_management/modules/license_upload/webservice/certificate_upload_request.dart';

abstract class CertificateUploadRepository {
  Future<void> uploadCertificates({
    required List<LicenseItemModel> certificates,
    required String id,
  }) async {}
}

class CertificateUploadRepoImpl implements CertificateUploadRepository {
  final CertificateUploadRequest _request = CertificateUploadRequest();

  @override
  Future<void> uploadCertificates({
    required List<LicenseItemModel> certificates,
    required String id,
  }) {
    return _request.uploadCertificates(
      certificates: certificates,
      id: id,
    );
  }
}
