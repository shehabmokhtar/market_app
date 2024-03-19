class Endpoints {
  static const String baseUrl = 'http://salahelden18-001-site1.atempurl.com/';

  // Account
  static const String signIn = 'api/Account/User/Login';
  static const String signUp = 'api/Account/User/Signup';
  static const String verifyOtp = 'api/Account/User/VerifyOtp';
  static const String forgetPassword = 'api/Account/forgotPassword';
  static const String resetPassword = 'api/Account/resetPassword';

  // Banners
  static const String banners = 'api/Banners';

  // Address
  static const String getCountries = 'api/Countries';
  static String getCountriesCities(String id) =>
      'api/Cities/countries-cities/$id';
  static String getDistrictsInCity(String id) =>
      'api/Districts/cities-districts/$id';
  static String getSubDistricstInDistricts(String id) =>
      'api/SubDistricts/districts-subdistricts/$id';
  static String address = 'api/Address';
}
