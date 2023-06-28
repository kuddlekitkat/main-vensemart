import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'RegisterScreen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.01,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/onb.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 390,
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome to Vensemart',
                  style: TextStyle(
                      fontSize: 1.5 * MediaQuery.of(context).size.height * 0.01,
                      color: Color(0xff1456f1),
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: const Color(0xff1456f1),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          'Sign in with email',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 1.5 *
                                  MediaQuery.of(context).size.height *
                                  0.01,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          'Sign up as a new user',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 1.5 *
                                  MediaQuery.of(context).size.height *
                                  0.01,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const RegisterScreen()));
                        },
                        child: const Text(
                          'SIGNUP',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff1456f1),
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
