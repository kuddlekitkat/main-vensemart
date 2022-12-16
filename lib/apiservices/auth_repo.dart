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

  Future<Response?> verifyOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("verify-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> updateProfile(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("update_profile", credentials);

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

  Future<Response?> services() async {
    Response? response = await apiGetRequests("services");

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
  Future<Response?> productId(String? num) async {
    Response? response = await apiGetRequests("product_details/$num");

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
}
