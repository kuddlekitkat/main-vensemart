import 'package:flutter/material.dart';
import 'package:vensemart/presentation/flash_screen/flash_screen.dart';
import 'package:vensemart/presentation/cancel_screen/cancel_screen.dart';
import 'package:vensemart/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:vensemart/presentation/notifications_screen/notifications_screen.dart';
import 'package:vensemart/presentation/home_screen_for_product_screen/home_screen_for_product_screen.dart';
import 'package:vensemart/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:vensemart/presentation/change_password_screen/change_password_screen.dart';
import 'package:vensemart/presentation/calendar_screen/calendar_screen.dart';
import 'package:vensemart/presentation/offers_screen/offers_screen.dart';
import 'package:vensemart/presentation/account_screen/account_screen.dart';
import 'package:vensemart/presentation/profile_two_screen/profile_two_screen.dart';
import 'package:vensemart/presentation/electronics_screen/electronics_screen.dart';
import 'package:vensemart/presentation/item_details_screen/item_details_screen.dart';
import 'package:vensemart/presentation/my_cart_screen/my_cart_screen.dart';
import 'package:vensemart/presentation/choose_address_screen/choose_address_screen.dart';
import 'package:vensemart/presentation/add_new_address_screen/add_new_address_screen.dart';
import 'package:vensemart/presentation/select_card_screen/select_card_screen.dart';
import 'package:vensemart/presentation/successful_payment_screen/successful_payment_screen.dart';
import 'package:vensemart/presentation/customer_profile_screen/customer_profile_screen.dart';
import 'package:vensemart/presentation/services_2_demo_screen/services_2_demo_screen.dart';
import 'package:vensemart/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String flashScreen = '/flash_screen';

  static const String cancelScreen = '/cancel_screen';

  static const String contactUsScreen = '/contact_us_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String homeScreenForProductScreen =
      '/home_screen_for_product_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String calendarScreen = '/calendar_screen';

  static const String offersScreen = '/offers_screen';

  static const String accountScreen = '/account_screen';

  static const String profileTwoScreen = '/profile_two_screen';

  static const String electronicsScreen = '/electronics_screen';

  static const String itemDetailsScreen = '/item_details_screen';

  static const String myCartScreen = '/my_cart_screen';

  static const String chooseAddressScreen = '/choose_address_screen';

  static const String addNewAddressScreen = '/add_new_address_screen';

  static const String selectCardScreen = '/select_card_screen';

  static const String successfulPaymentScreen = '/successful_payment_screen';

  static const String customerProfileScreen = '/customer_profile_screen';

  static const String services2DemoScreen = '/services_2_demo_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    flashScreen: (context) => FlashScreen(),
    cancelScreen: (context) => CancelScreen(),
    contactUsScreen: (context) => ContactUsScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    homeScreenForProductScreen: (context) => HomeScreenForProductScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    calendarScreen: (context) => CalendarScreen(),
    offersScreen: (context) => OffersScreen(),
    accountScreen: (context) => AccountScreen(),
    profileTwoScreen: (context) => ProfileTwoScreen(),
    electronicsScreen: (context) => ElectronicsScreen(),
    itemDetailsScreen: (context) => ItemDetailsScreen(),
    myCartScreen: (context) => MyCartScreen(),
    chooseAddressScreen: (context) => ChooseAddressScreen(),
    addNewAddressScreen: (context) => AddNewAddressScreen(),
    selectCardScreen: (context) => SelectCardScreen(),
    successfulPaymentScreen: (context) => SuccessfulPaymentScreen(),
    customerProfileScreen: (context) => CustomerProfileScreen(),
    services2DemoScreen: (context) => Services2DemoScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
