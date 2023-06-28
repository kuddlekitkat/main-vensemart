import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

class FlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.blueA700,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgFire,
                height: getVerticalSize(
                  99.00,
                ),
                width: getHorizontalSize(
                  98.00,
                ),
                margin: getMargin(
                  top: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
