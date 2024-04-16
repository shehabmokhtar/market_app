import 'package:market_app/core/services/global_variables.dart';

class Endpoints {
  static const String baseUrl =
      'http://salahelden18-001-site1.atempurl.com/api/';

  // Account
  static const String signIn = 'Account/User/Login';
  static const String signUp = 'Account/User/Signup';
  static const String verifyOtp = 'Account/User/VerifyOtp';
  static const String forgetPassword = 'Account/forgotPassword';
  static const String resetPassword = 'Account/resetPassword';
  static String configFCM() => 'Account/configFCM/$fcmToken';

  // Banners
  static const String banners = 'Banners';

  // Address
  static const String getCountries = 'Countries';
  static String getCountriesCities(String id) => 'Cities/countries-cities/$id';
  static String getDistrictsInCity(String id) =>
      'Districts/cities-districts/$id';
  static String getSubDistricstInDistricts(String id) =>
      'SubDistricts/districts-subdistricts/$id';
  static const String address = 'Address';
  static String specificAddress(String id) => 'Address/$id';

  // User
  static const String user = 'User';

  // Branch
  static const String nearBranch = 'Branch/Near-Branch';

  // Category
  static String category(String branchId) => 'Branch/$branchId/BranchCategory';

  // Favorites
  static const String favorites = 'FavoriteProduct';
  static String favoritesId(String productId) => 'FavoriteProduct/$productId';

  // Branch Category
  static String subCategoriesAndProducts(int branchCategoryId) =>
      'Branch/${branchInfo!.id}/BranchCategory/${branchCategoryId.toString()}/branch-products';

  // Basket
  static String addToBasket = 'Basket';
  static String basket = 'Basket/${branchInfo!.id}';
  static String increaseProductQuantity(int itemId) =>
      'Basket/increase-quantity/${itemId.toString()}';
  static String decreaseProductQuantity(int itemId) =>
      'Basket/decrease-quantity/${itemId.toString()}';
}
