import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';

class SuccessfulPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 54,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 11, bottom: 11),
                    onTap: () => onTapArrowleft8(context)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Success")),
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                          height: 64,
                          width: 64,
                          variant: IconButtonVariant.FillBlueA700,
                          shape: IconButtonShape.CircleBorder32,
                          padding: IconButtonPadding.PaddingAll17,
                          child: CustomImageView(
                              svgPath: ImageConstant.imgCheckmark)),
                      Container(
                          width: getHorizontalSize(236.00),
                          margin: getMargin(top: 36),
                          child: Text(
                              "Your order has been placed\nsuccessfully",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsRegular17)),
                      Container(
                          width: getHorizontalSize(170.00),
                          margin: getMargin(top: 9),
                          child: Text(
                              "The order details has been sent to\nyour email",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsRegular10Black9007f)),
                      CustomButton(
                          height: 48,
                          width: 177,
                          text: "Continue Shopping",
                          margin: getMargin(top: 34, bottom: 5),
                          padding: ButtonPadding.PaddingAll14,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold12,
                          onTap: () => onTapContinueshopping(context))
                    ]))));
  }

  onTapContinueshopping(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreenForProductScreen);
  }

  onTapArrowleft8(BuildContext context) {
    Navigator.pop(context);
  }
}
