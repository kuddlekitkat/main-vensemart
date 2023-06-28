import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight / 11,
      width: screenWidth / 1.02,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Center(
        child: AutoSizeText('Register'),
      ),
    );
  }
}
