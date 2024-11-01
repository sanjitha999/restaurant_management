enum LicenseCertificates {
  GSTCertificate(name: 'GST Certificate'),
  TradeLicenseCertificate(name: 'Trade License Certificate'),
  WaterLicenseCertificate(name: 'Water License Certificate'),
  PestControlCertificate(name: 'Pest Control Certificate'),
  FoodLicenseCertificate(name: 'Food License Certificate');

  final String name;

  const LicenseCertificates({required this.name});
}
