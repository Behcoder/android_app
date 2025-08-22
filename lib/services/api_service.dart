import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String get consumerKey => dotenv.env['WOOCOMMERCE_CONSUMER_KEY'] ?? '';
  static String get consumerSecret =>
      dotenv.env['WOOCOMMERCE_CONSUMER_SECRET'] ?? '';
  static String get baseUrl => dotenv.env['WOOCOMMERCE_BASE_URL'] ?? '';

  // ساخت URL برای دسته‌بندی‌ها
  static String getCategoriesUrl() {
    return '$baseUrl/products/categories?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=100';
  }

  // ساخت URL برای محصولات
  static String getProductsUrl({String? categoryId, int page = 1}) {
    String url =
        '$baseUrl/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=100';
    if (categoryId != null) {
      url += '&category=$categoryId';
    }
    if (page > 1) {
      url += '&page=$page';
    }
    return url;
  }

  // ساخت URL برای محصولات ویژه
  static String getFeaturedProductsUrl(String categoryId) {
    return '$baseUrl/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=100&category=$categoryId';
  }

  // ساخت URL برای محصولات جدید
  static String getNewProductsUrl() {
    return '$baseUrl/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=100&orderby=date&order=desc';
  }

  // ساخت URL برای زیردسته‌ها
  static String getSubCategoriesUrl(int parentId) {
    return '$baseUrl/products/categories?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=100&parent=$parentId';
  }

  // ساخت URL برای نظرات محصول
  static String getProductReviewsUrl(int productId) {
    return '$baseUrl/products/reviews?consumer_key=$consumerKey&consumer_secret=$consumerSecret&product=$productId';
  }

  // ساخت URL برای ارسال نظر
  static String getSubmitReviewUrl() {
    return '$baseUrl/products/reviews?consumer_key=$consumerKey&consumer_secret=$consumerSecret';
  }

  // ساخت URL برای بررسی دسته‌بندی‌های خالی
  static String getCategoryCheckUrl(String categoryId) {
    return '$baseUrl/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&category=$categoryId&per_page=1';
  }
}
