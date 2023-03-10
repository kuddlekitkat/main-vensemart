import 'package:dio/dio.dart';

import 'api_services.dart';

class AuthRepo with ApiServices {
  Future<Response?> login(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("login", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> register(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("register", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("send-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> deleteAccount(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("delete-account", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> verifyOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("verify-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addBooking(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("book-service", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addProductToCart(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("add_cart", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  // Future<Response?> updateProfile(Map<String, String> credentials) async {
  //   Response? response = await apiPostRequests("update_profile", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }

  Future<Map<String, dynamic>?> updateProfile(
      Map<String, dynamic> credentials) async {
    Map<String, dynamic>? response =
        await apiUploadPostRequests("update_profile", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> customerHome(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("home", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> userDetail() async {
    Response? response = await apiGetRequests("user_details");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> userLocation() async {
    Response? response = await apiGetRequests("get-location");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> services() async {
    Response? response = await apiGetRequests("get-all-service-categories");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> cartlist() async {
    Response? response = await apiGetRequests("cart_list");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> rateCustomer(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("rate-service-provider", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> upcomingBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/1");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> completedBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/2");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> canceledBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/3");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendPasswordChange(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("forgot-password", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> changePassword(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("forgot-password-change", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> trendingServices() async {
    Response? response = await apiGetRequests("get-trending-services");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> productCategory(String? num) async {
    Response? response = await apiGetRequests("products/$num");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> getAllCategories() async {
    Response? response = await apiGetRequests("products");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> getAllFeaturedShops() async {
    Response? response = await apiGetRequests("products/featured-stores");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> availableServ(
      String? num, String? lat, String? long) async {
    Response? response =
        await apiGetRequests("serviceprovider_list/$num?lat=$lat&lng=$long");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> productId(String? num) async {
    Response? response = await apiGetRequests("product_details/$num");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> shopbyId(String? num) async {
    Response? response = await apiGetRequests("shop/$num");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> serviceId(String? num) async {
    Response? response = await apiGetRequests("service-provider/$num");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> termsCondition() async {
    Response? response = await apiGetRequests("terms-conditions");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> aboutUs() async {
    Response? response = await apiGetRequests("about-us");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> contactUs() async {
    Response? response = await apiGetRequests("contact-us");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> faqs() async {
    Response? response = await apiGetRequests("faqs");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendLocation(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("set-location", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> sendSupportMessage(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("send-support-message", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> serviceCategory() async {
    Response? response = await apiGetRequests("get-all-service-categories");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> serviceCateg(String? num) async {
    Response? response = await apiGetRequests("serviceprovider_list/$num");

    if (response != null) {
      return response;
    }

    return null;
  }
}
