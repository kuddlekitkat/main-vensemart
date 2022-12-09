import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../ChoiceIntroScreen.dart';
import '../../apiservices/auth_repo.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;


  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.login(map!);
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



  void register({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.register(map!);
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
}
