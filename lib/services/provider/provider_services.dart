import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/session_manager.dart';
import 'package:vensemart/models/register.dart';
import 'package:vensemart/models/services_model.dart';
import '../../ChoiceIntroScreen.dart';
import '../../apiservices/auth_repo.dart';
import '../../models/user_details.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;
  RegisterModel? get registerModel => _registerModel;
  RegisterModel? _registerModel;
  UserDetailsModel? get userDetailsModel => _userDetailsModel;
  UserDetailsModel? _userDetailsModel;
  ServicesModel? get servicesModel => _servicesModel;
  ServicesModel? _servicesModel;

  bool get isAvailable =>
      _servicesModel != null &&
      _servicesModel?.data != null &&
      _servicesModel!.data!.isNotEmpty;

  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.login(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => const ChoiceIntroScreen(),
          ),
        );
        notifyListeners();
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void register({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.register(map!);
      if (response != null && response.statusCode == 200) {
        _registerModel = RegisterModel.fromJson(response.data);
        print(_registerModel!.data!.email!);
        SessionManager.instance.authToken = _registerModel!.data!.apiToken!;
        _isLoading = false;
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => const ChoiceIntroScreen(),
          ),
        );
        notifyListeners();
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void userDetails() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.userDetail();
      if (response != null && response.statusCode == 200) {
        _userDetailsModel = UserDetailsModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void services() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.services();
      if (response != null && response.statusCode == 200) {
        _servicesModel = ServicesModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }
}
