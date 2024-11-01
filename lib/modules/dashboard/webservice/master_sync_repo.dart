
import 'package:resturant_management/modules/dashboard/webservice/master_sync_request.dart';

abstract class MasterSyncRepository {
  Future<void> getMasterSyncData();
}

class MasterSyncRepoImpl extends MasterSyncRepository {
  final MasterSyncRequest _masterSyncRequest = MasterSyncRequest();
  @override
  Future<void> getMasterSyncData() {
    return _masterSyncRequest.getMasterSyncData();
  }

}