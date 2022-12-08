import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/ChoiceIntroScreen.dart';

import 'RegisterScreen.dart';
import 'apiservices/auth_repo.dart';

class LoginScreen extends StatefulWidget {
  static var routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    AuthRepo authRepo = AuthRepo();
    try {
      Response? response = await authRepo.login({
        "userdata": emailController.text,
        "password": passwordController.text,
        "type": "3",
        "device_id": "12312313213",
        "device_type": "ios",
        "device_name": "iphone 12",
        "device_token":
            "fWmhg-bbSfGEqOoHZkKCmj:APA91bGpk7jbGRVP75GFgf0g65_mDjYpWI259vsgAlcm_3EXqVI-h4n069lhPC1euSKSuUfDolkUZnW6OXIN7oQc3YpMeUPYUeXi9AgHAGEg_SE9xmtlrRhdnf2PSVpEM73flWRxivxV",
      });
      if (response != null && response.statusCode == 200) {
        Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => ChoiceIntroScreen(),
                        ),
                      );
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xff1456f1);
      }
      return Colors.red;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1456f1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                'Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text('Email'),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintText: 'email',
                          prefixIcon: Icon(Icons.email_rounded),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250, 250, 254, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text('password'),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintText: 'password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250, 250, 254, 1)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 13.0),
                        child: Text(
                          'Forgot password ?',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1456f1)),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => signIn(),
                    child: Center(
                      child: Container(
                        height: screenHeight / 11,
                        width: screenWidth / 1.10,
                        decoration: BoxDecoration(
                          color: Color(0xff1456f1),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20.0)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'signup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color(0xff1456f1)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
