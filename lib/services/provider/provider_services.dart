import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/session_manager.dart';
import 'package:vensemart/models/about_us_model.dart';
import 'package:vensemart/models/add_booking_model.dart';
import 'package:vensemart/models/add_product_to_cart_model.dart';
import 'package:vensemart/models/contact_us_model.dart';
import 'package:vensemart/models/customer_home_model.dart';
import 'package:vensemart/models/general_model.dart';
import 'package:vensemart/models/get_shop_by_id_model.dart';
import 'package:vensemart/models/login_model.dart';
import 'package:vensemart/models/register.dart';
import 'package:vensemart/models/services_model.dart';
import 'package:vensemart/models/terms_and_condition_model.dart';
import 'package:vensemart/services/screens/ConfirmAddressScreen.dart';
import '../../ChangePassScreen.dart';
import '../../ChoiceIntroScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../OtpVerification.dart';
import '../../apiservices/auth_repo.dart';
import '../../models/accept_reject_booking.dart';
import '../../models/canceled_bookings.dart';
import '../../models/cart_model.dart';
import '../../models/completed_bookings.dart';
import '../../models/faqs_model.dart';
import '../../models/featured_shop_model.dart';
import '../../models/get_all_referrals_model.dart';
import '../../models/get_all_referred_users_with_bookings_model.dart';
import '../../models/get_all_services_model.dart';
import '../../models/get_all_trending_services_model.dart';
import '../../models/location_model.dart';
import '../../models/order.dart';
import '../../models/product_category.dart';
import '../../models/product_category_model.dart';
import '../../models/product_id_model.dart';
import '../../models/service_id_model.dart';
import '../../models/service_provider_id_model.dart';
import '../../models/upcoming_bookings.dart';
import '../../models/update_profile_model.dart';
import '../../models/user_details.dart';
import '../../products/screens/CartScreen.dart';
import '../screens/ContactScreen.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;
  // RegisterModel? get registerModel => _registerModel;
  RegisterModel? _registerModel;
  UserDetailsModel? get userDetailsModel => _userDetailsModel;
  UserDetailsModel? _userDetailsModel;


  AcceptRejectBookingModel? get acceptRejectBookingModel =>
      _acceptRejectBookingModel;
  AcceptRejectBookingModel? _acceptRejectBookingModel;

  UserLocationModel? get userLocationModel => _userLocationModel;
  UserLocationModel? _userLocationModel;

  ServicesModel? get servicesModel => _servicesModel;
  ServicesModel? _servicesModel;

  ReferralsModel? get referralsModel => _referralsModel;
  ReferralsModel? _referralsModel;

  CartModel? get cartModel => _cartModel;
  CartModel? _cartModel;


  ReferredUsersBookingModel? get referredUsersBookingModel => _referredUsersBookingModel;
  ReferredUsersBookingModel? _referredUsersBookingModel;

  OrderModel? get orderModel => _orderModel;
  OrderModel? _orderModel;

  TrendingServiceModel? get trendingserviceModel => _trendingserviceModel;
  TrendingServiceModel? _trendingserviceModel;

  UpdateProfileModel? get updateProfileModel => _updateProfileModel;
  UpdateProfileModel? _updateProfileModel;

  AddBookingModel? get addBooking => _addBookingModel;
  AddBookingModel? _addBookingModel;

  AddProductToCartModel? get addProductToCartModel => _addProductToCartModel;
  AddProductToCartModel? _addProductToCartModel;

  CustomerHomeModel? get customerHomeModel => _customerHomeModel;
  CustomerHomeModel? _customerHomeModel;

  ProductCategory? get productCategory => _productCategory;
  ProductCategory? _productCategory;

  ProductCategoryModel? get productCategoryModel => _productCategoryModel;
  ProductCategoryModel? _productCategoryModel;

  FeaturedShopModel? get featuredShopModel => _featuredShopModel;
  FeaturedShopModel? _featuredShopModel;

  ProductIdModel? get productIdModel => _productIdModel;
  ProductIdModel? _productIdModel;

  ServiceIdModel? get serviceIdModel => _serviceIdModel;
  ServiceIdModel? _serviceIdModel;

  ShopByIdModel? get shopbyIdModel => _shopbyIdModel;
  ShopByIdModel? _shopbyIdModel;

  ServiceProviderIdModel? get serviceProviderIdModel => _serviceProviderIdModel;
  ServiceProviderIdModel? _serviceProviderIdModel;

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

  UpcomingBooking? get upcomingBooking => _upcomingBooking;
  UpcomingBooking? _upcomingBooking;

  CompletedBooking? get completedBooking => _completedBooking;
  CompletedBooking? _completedBooking;

  CancelledBooking? get cancelledBooking => _cancelledBooking;
  CancelledBooking? _cancelledBooking;

  LoginModel? get loginModel => _loginModel;
  LoginModel? _loginModel;

  bool get isAvailable =>
      _servicesModel != null &&
      _servicesModel?.data != null &&
      _servicesModel!.data!.isNotEmpty;

  bool get isReady =>
      _trendingserviceModel != null &&
      _trendingserviceModel?.data != null &&
      _trendingserviceModel!.data!.isNotEmpty;

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
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_loginModel?.message}'),
          duration: const Duration(seconds: 10),
        ));
        SessionManager.instance.authToken = _loginModel!.data!.apiToken!;
        Navigator.pushReplacement(
          context!,
          MaterialPageRoute(
            builder: (context) => const ChoiceIntroScreen(),
          ),
        );
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }

      notifyListeners();
    } catch (e, str) {
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: AutoSizeText('${_loginModel?.message}'),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ));
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void signOut() async {
    try {
      SessionManager.instance.logOut();

      SessionManager.instance.isLoggedIn = false;

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
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_registerModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
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

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_registerModel?.message}'),
          duration: const Duration(seconds: 10),
        ));

        _isLoading = false;
      }

      notifyListeners();
    } catch (e, str) {
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: AutoSizeText('${_registerModel?.message}'),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ));
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void acceptRejectBooking(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.acceptRejectBooking(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _acceptRejectBookingModel =
            AcceptRejectBookingModel.fromJson(response.data);

        ScaffoldMessenger.of(context!).removeCurrentSnackBar();
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_acceptRejectBookingModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
        // Navigator.pushReplacement(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceLocationScreen(),
        //   ),
        // );
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      ScaffoldMessenger.of(context!).removeCurrentSnackBar();
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: AutoSizeText('${_acceptRejectBookingModel?.message}'),
        duration: const Duration(seconds: 10),
        // action: SnackBarAction(
        //   label: 'ACTION',
        //   onPressed: () { },
        // ),
      ));
      notifyListeners();
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

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('make sure you have registered first'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }

      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void verifyOTP({context, otpNumber}) async {
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
            builder: (context) => ContactScreen(),
          ),
        );
        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: const AutoSizeText('make sure you have registered first'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }

      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void updateProfile({context, Map<String, dynamic>? credentials}) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await authRepo.updateProfile(credentials!);
      if (response != null) {
        _isLoading = false;

        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: const AutoSizeText('Update successful'),
          duration: const Duration(seconds: 10),
        ));
        // Navigator.push(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceProviderHomeScreen(),
        //   ),
        // );

      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void sendLocation({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.sendLocation(map!);
      if (response != null && response.statusCode == 200) {
        _userLocationModel = UserLocationModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_userLocationModel?.message}'),
          duration: const Duration(seconds: 5),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:
              AutoSizeText('Please make sure to enter the correct location'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void sendSupportMessage(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.sendSupportMessage(map!);
      if (response != null && response.statusCode == 200) {
        // _userLocationModel = UserLocationModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: const AutoSizeText('message sent successfully'),
          duration: const Duration(seconds: 5),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText(
              'Please make sure to enter email, support and message'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getLocation({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.sendLocation(map!);
      if (response != null && response.statusCode == 200) {
        _userLocationModel = UserLocationModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${_userLocationModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Please make sure you have set location first'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void addNewBooking({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addBooking(map!);
      if (response != null && response.statusCode == 200) {
        _addBookingModel = AddBookingModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Please make sure you have set location first'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void addProductToCart(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addProductToCart(map!);
      if (response != null && response.statusCode == 200) {
        _addProductToCartModel = AddProductToCartModel.fromJson(response.data);

        _isLoading = false;
        cartlist();
        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        //   content: AutoSizeText('Failed to add Product to Cart'),
        //   duration: const Duration(seconds: 10),
        //   action: SnackBarAction(
        //     label: 'ACTION',
        //     onPressed: () {},
        //   ),
        // ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void addOrder({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addOrder(map!);
      if (response != null && response.statusCode == 200) {
        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Order Created Successfully'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;
        cartlist();
        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Failed to add Order, please make payment'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void removeProductToCart(
      {Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;

      Response? response = await authRepo.removeProduct(map!);
      if (response != null && response.statusCode == 200) {
        notifyListeners();

        // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        //   content: AutoSizeText('Removing Product from Cart'),
        //   duration: const Duration(seconds: 10),
        //   action: SnackBarAction(
        //     label: 'ACTION',
        //     onPressed: () {},
        //   ),
        // ));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CartScreen(),
        //   ),
        // );

        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        _isLoading = false;
        cartlist();
        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Failed to remove Product to Cart'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void reduceQuantity({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.reduceQuantity(map!);
      if (response != null && response.statusCode == 200) {
        cartlist();
        notifyListeners();
        // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        //   content: AutoSizeText('reducing item quantity'),
        //   duration: const Duration(seconds: 10),
        //   action: SnackBarAction(
        //     label: 'ACTION',
        //     onPressed: () {},
        //   ),
        // ));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CartScreen(),
        //   ),
        // );

        notifyListeners();
        _isLoading = false;
        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        notifyListeners();
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Failed to reduce product quantity'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void addQuantity({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      // notifyListeners();
      Response? response = await authRepo.addQuantity(map!);

      print(response);
      if (response != null && response.statusCode == 200) {
        cartlist();

        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Failed to add Quantity'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
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

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
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

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void rateCustomer({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.rateCustomer(map!);
      if (response != null && response.statusCode == 200) {
        // _isLoading = false;
        // SessionManager.instance.isLoggedIn = true;

        // _completedRequestModel = CompletedRequestModel.fromJson(response.data);
        //
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${response.statusMessage}'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));
        // Navigator.pushReplacement(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceLocationScreen(),
        //   ),
        // );
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: AutoSizeText('$e'),
        duration: const Duration(seconds: 10),
        // action: SnackBarAction(
        //   label: 'ACTION',
        //   onPressed: () { },
        // ),
      ));
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void userLocation() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.userLocation();
      if (response != null && response.statusCode == 200) {
        _userLocationModel = UserLocationModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
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

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void referrals() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.referrals();
      if (response != null && response.statusCode == 200) {
        _referralsModel = ReferralsModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void cartlist() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.cartlist();
      if (response != null && response.statusCode == 200) {
        _cartModel = CartModel.fromJson(response.data);
        print('.....carter ${_cartModel!.toJson()}');
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void refUserslist() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.referredUsersWithBookings();
      if (response != null && response.statusCode == 200) {
        _referredUsersBookingModel = ReferredUsersBookingModel?.fromJson(response.data);
        print('.....carter ${_referredUsersBookingModel!.toJson()}');
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void trendingServices() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.trendingServices();
      if (response != null && response.statusCode == 200) {
        _trendingserviceModel = TrendingServiceModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
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

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllOrders() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getAllOrders();
      if (response != null && response.statusCode == 200) {
        _orderModel = OrderModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllCategories() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getAllCategories();
      if (response != null && response.statusCode == 200) {
        _productCategory = ProductCategory.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllFeaturedShops() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getAllFeaturedShops();
      if (response != null && response.statusCode == 200) {
        _featuredShopModel = FeaturedShopModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void servicesCate(String num) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.serviceCateg(num);
      if (response != null && response.statusCode == 200) {
        _serviceProviderIdModel =
            ServiceProviderIdModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void sendPasswordChange(
      {required context, required String phoneNumber}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response =
          await authRepo.sendPasswordChange({'phone_number': phoneNumber!});
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ChangePassScreen(userPhone: phoneNumber!),
          ),
        );
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('Please register first'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void changePassword({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.changePassword(map!);
      if (response != null && response.statusCode == 200) {
        // _registerModel = RegisterModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${response?.statusMessage}'),
          duration: const Duration(seconds: 10),
        ));
        _isLoading = false;
        // sendOTP(context);
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${response?.statusMessage}'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      var response;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: AutoSizeText('${response?.statusMessage}'),
        duration: const Duration(seconds: 10),
        // action: SnackBarAction(
        //   label: 'ACTION',
        //   onPressed: () { },
        // ),
      ));
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void deleteAccount({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.deleteAccount(map!);
      if (response != null && response.statusCode == 200) {
        // _registerModel = RegisterModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: AutoSizeText('Account Deleted Successfully'),
          duration: Duration(seconds: 10),
        ));
        _isLoading = false;
        // sendOTP(context);
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: AutoSizeText('${response?.statusMessage}'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      print(e);
      notifyListeners();
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

      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void ShopbyId(String num) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.shopbyId(num);
      if (response != null && response.statusCode == 200) {
        _shopbyIdModel = ShopByIdModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void availableServ(String num, String lat, String long) async {
    try {
      _isLoading = true;
      Response? response = await authRepo.availableServ(num, lat, long);
      if (response != null && response.statusCode == 200) {
        _serviceIdModel = ServiceIdModel.fromJson(response.data);
        _isLoading = false;
      }

      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
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
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }

      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllUpcomingBookings() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.upcomingBookings();
      if (response != null && response.statusCode == 200) {
        _upcomingBooking = UpcomingBooking.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllCompletedBookings() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.completedBookings();
      if (response != null && response.statusCode == 200) {
        _completedBooking = CompletedBooking.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllCanceledBookings() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.canceledBookings();
      if (response != null && response.statusCode == 200) {
        _cancelledBooking = CancelledBooking.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }
}
