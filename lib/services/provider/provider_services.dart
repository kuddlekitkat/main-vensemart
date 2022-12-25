import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/session_manager.dart';
import 'package:vensemart/models/about_us_model.dart';
import 'package:vensemart/models/add_booking_model.dart';
import 'package:vensemart/models/contact_us_model.dart';
import 'package:vensemart/models/customer_home_model.dart';
import 'package:vensemart/models/general_model.dart';
import 'package:vensemart/models/login_model.dart';
import 'package:vensemart/models/register.dart';
import 'package:vensemart/models/services_model.dart';
import 'package:vensemart/models/terms_and_condition_model.dart';
import '../../ChoiceIntroScreen.dart';
import '../../OtpVerification.dart';
import '../../apiservices/auth_repo.dart';
import '../../models/faqs_model.dart';
import '../../models/get_all_services_model.dart';
import '../../models/product_category_model.dart';
import '../../models/product_id_model.dart';
import '../../models/service_id_model.dart';
import '../../models/update_profile_model.dart';
import '../../models/user_details.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;
  // RegisterModel? get registerModel => _registerModel;
  RegisterModel? _registerModel;
  UserDetailsModel? get userDetailsModel => _userDetailsModel;
  UserDetailsModel? _userDetailsModel;
  ServicesModel? get servicesModel => _servicesModel;
  ServicesModel? _servicesModel;
  UpdateProfileModel? get updateProfileModel => _updateProfileModel;
  UpdateProfileModel? _updateProfileModel;


  AddBookingModel? get addBooking => _addBookingModel;
  AddBookingModel? _addBookingModel;


  CustomerHomeModel? get customerHomeModel => _customerHomeModel;
  CustomerHomeModel? _customerHomeModel;
  ProductCategoryModel? get productCategory => _productCategoryModel;
  ProductCategoryModel? _productCategoryModel;
  ProductIdModel? get productIdModel => _productIdModel;
  ProductIdModel? _productIdModel;

  ServiceIdModel? get serviceIdModel => _serviceIdModel;
  ServiceIdModel? _serviceIdModel;

  ServiceCategoryModel? get serviceCategoryModel => _servicesCategoryModel;
  ServiceCategoryModel? _servicesCategoryModel;


  TermsAndConditionModel? get termsAndCondition => _termsSndCondition;
  TermsAndConditionModel? _termsSndCondition;
  AboutUsModel? get aboutUsModel => _aboutUsModel;
  AboutUsModel? _aboutUsModel;
  ContactUsModel? get contactUsModel => _contactUsModel;
  ContactUsModel? _contactUsModel;
  FaqsModel? get faqsModel => _faqsModel;
  FaqsModel? _faqsModel;
  LoginModel? get loginModel => _loginModel;
  LoginModel? _loginModel;

  bool get isAvailable =>
      _servicesModel != null &&
      _servicesModel?.data != null &&
      _servicesModel!.data!.isNotEmpty;

  bool get isPresent =>
      _productCategoryModel != null &&
          _productCategoryModel?.data != null &&
          _productCategoryModel!.data!.isNotEmpty;

  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.login(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _loginModel = LoginModel.fromJson(response.data);
        print(_loginModel?.data?.apiToken);
        SessionManager.instance.authToken = _loginModel!.data!.apiToken!;
        Navigator.pushReplacement(
          context!,
          MaterialPageRoute(
            builder: (context) => const ChoiceIntroScreen(),
          ),
        );
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
        sendOTP(context);
        // Navigator.push(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => OtpVerification(),
        //   ),
        // );
        notifyListeners();
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void sendOTP(context) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response =
          await authRepo.sendOtp({'phone_number': phoneNumber!});
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => OtpVerification(),
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

  void verifyOTP({context,otpNumber}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo
          .verifyOtp({"phone_number": phoneNumber!, "otp": otpNumber});
      if (response != null && response.statusCode == 200) {
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

  void updateUserProfile(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.updateProfile(map!);
      if (response != null && response.statusCode == 200) {
        _updateProfileModel = UpdateProfileModel.fromJson(response.data);
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void addNewBooking(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addBooking(map!);
      if (response != null && response.statusCode == 200) {
        _addBookingModel = AddBookingModel.fromJson(response.data);
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void customerHome({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.customerHome(map!);
      if (response != null && response.statusCode == 200) {
        _customerHomeModel = CustomerHomeModel.fromJson(response.data);
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

  void productCate(String num) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.productCategory(num);
      if (response != null && response.statusCode == 200) {
        _productCategoryModel = ProductCategoryModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void productId(String num) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.productId(num);
      if (response != null && response.statusCode == 200) {
        _productIdModel = ProductIdModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void serviceId(String num) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.serviceId(num);
      if (response != null && response.statusCode == 200) {
        _serviceIdModel = ServiceIdModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void termsAndCon() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.termsCondition();
      if (response != null && response.statusCode == 200) {
        _termsSndCondition = TermsAndConditionModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void aboutUs() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.aboutUs();
      if (response != null && response.statusCode == 200) {
        _aboutUsModel = AboutUsModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void constantUs() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.contactUs();
      if (response != null && response.statusCode == 200) {
        _contactUsModel = ContactUsModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void faqs() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.faqs();
      if (response != null && response.statusCode == 200) {
        _faqsModel = FaqsModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllServiceList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.serviceCategory();
      if (response != null && response.statusCode == 200) {
        _servicesCategoryModel = ServiceCategoryModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }
}
