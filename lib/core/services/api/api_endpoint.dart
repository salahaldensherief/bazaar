class ApiEndPoint {
  static const String baseUrl = 'https://bazaar-e-commerece.vercel.app/api/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String email = 'email';
  static const String password = 'password';
  static const String username = 'username';
  static const String signOut = 'auth/logout';
  static const String getAllProducts = 'product/get-all-products';
  static const String addToWishList = 'user/add-to-wishlist';
  static const String deleteFromWishList = 'user/delete-wishlist';
  static const String getWishList = 'user/wishlist-data';
  static const String searchProducts= 'product/search-products';
  static const String fetchCategories= 'product/get-category-product';
  static const String fetchProductsByCategory= 'product/category-wise-product';
  static const String checkout= 'payment/checkout';
  static const String addToCart= 'user/add-to-cart';
  static const String getCart= 'user/cart-data';
  static const String deleteCart= 'user/delete-cart';

}