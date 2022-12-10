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
}
