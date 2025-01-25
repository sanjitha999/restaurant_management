class EndPoints {
  static const String baseUrl =
      'ec2-52-66-198-247.ap-south-1.compute.amazonaws.com:8080';
  static const String login = '/highwayhelper/login';
  static const String masterSync = '/highwayhelper/masterDataSync';
  static const String restaurantOnboard = '/highwayhelper/onBoardBusiness';
  static const String certificateUpload = '/highwayhelper/uploadCertificates';
  static const String firstApprovalCheck = '/highwayhelper/approvalCheck';
  static const String getBusiness = '/highwayhelper/getBusiness';
  static const String getBusinessList = '/highwayhelper/getBusinessList';
  static String approveBusiness(String businessId) => '/highwayhelper/approveBusinessOnboard/$businessId';
  static String rejectBusiness(String businessId) => '/highwayhelper/rejectBusinessOnboard/$businessId';
  static String addMenuItem(String businessId) => '/highwayhelper/addMenuItem/$businessId';
  static String getMenuList(String businessId) => '/highwayhelper/getMenuList/$businessId';
  static String uploadMenuItemImage(String businessId, String menuId) => '/highwayhelper/uploadImages/$menuId/$businessId';
  static String uploadBusinessImage(String businessId) => '/highwayhelper/addBusinessImages/$businessId';
  static const String downloadMenuItemImage = '/highwayhelper/images/menuImages';
  static String approveMenu(String businessId) => '/highwayhelper/secondLevelCheck/$businessId';
  static const String getAdminList = '/highwayhelper/superUser/getAdminList';
  static const String adminOnboard = '/highwayhelper/superUser/addAdmin';
  static const String restaurantAssociateOnboard = '/highwayhelper/addBusinessUser';
  static const String getBusinessUserList = '/highwayhelper/getBusinessUsersList';
  static const String getBusinessImages = '/highwayhelper/images/businessImages';
}
