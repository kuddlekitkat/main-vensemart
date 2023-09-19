import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class SelectCardScreen extends StatelessWidget {
  String radioGroup = "";

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
                    onTap: () => onTapArrowleft7(context)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Card payment"),
                actions: [
                  Container(
                      height: getVerticalSize(6.00),
                      margin:
                          getMargin(left: 24, top: 25, right: 24, bottom: 25),
                      child: SmoothIndicator(
                          offset: 0,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 2,
                              activeDotColor: ColorConstant.gray5001,
                              dotHeight: getVerticalSize(6.00),
                              dotWidth: getHorizontalSize(6.00)), size: Size(width, height),))
                ]),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 28, right: 20, bottom: 28),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(
                              left: 15, top: 13, right: 15, bottom: 13),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Row(children: [
                            Padding(
                                padding: getPadding(top: 1, bottom: 1),
                                child: Text("Master Card",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPoppinsRegular9Black900)),
                            Padding(
                                padding:
                                    getPadding(left: 5, top: 3, right: 168),
                                child: Text("****************5421",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular9Black900))
                          ])),
                      Container(
                          margin: getMargin(top: 15),
                          padding: getPadding(
                              left: 13, top: 12, right: 13, bottom: 12),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding:
                                        getPadding(left: 2, top: 2, bottom: 2),
                                    child: CustomRadioButton(
                                        text: "Master Card/Visa/Verve",
                                        iconSize: 16,
                                        value: "msg_master_card_visa_verve" "",
                                        groupValue: radioGroup,
                                        margin: getMargin(
                                            left: 2, top: 2, bottom: 2),
                                        onChange: (value) {
                                          radioGroup = value;
                                        })),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: getSize(20.00),
                                    width: getSize(20.00))
                              ])),
                      CustomButton(
                          height: 44,
                          width: 350,
                          text: "Add Payment Method",
                          margin: getMargin(top: 35, bottom: 5),
                          variant: ButtonVariant.FillDeeporange50,
                          shape: ButtonShape.RoundedBorder20,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold10)
                    ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 20, right: 20, bottom: 35),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                      height: 48,
                      width: 350,
                      text: "Pay Now",
                      fontStyle: ButtonFontStyle.PoppinsSemiBold14,
                      onTap: () => onTapPaynow(context))
                ]))));
  }

  onTapPaynow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successfulPaymentScreen);
  }

  onTapArrowleft7(BuildContext context) {
    Navigator.pop(context);
  }
}
