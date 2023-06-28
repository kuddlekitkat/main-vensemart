import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_bottom_bar.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class AccountScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(260.00),
                          width: size.width,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                        width: size.width,
                                        padding: getPadding(
                                            left: 20,
                                            top: 25,
                                            right: 20,
                                            bottom: 25),
                                        decoration: AppDecoration.fillBlueA700,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomIconButton(
                                                  height: 34,
                                                  width: 34,
                                                  margin: getMargin(bottom: 53),
                                                  onTap: () {
                                                    onTapBtnArrowleft(context);
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowleft))
                                            ]))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        width: size.width,
                                        padding: getPadding(
                                            left: 21,
                                            top: 22,
                                            right: 21,
                                            bottom: 22),
                                        decoration: AppDecoration.fillWhiteA700,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 22),
                                                  child: Text("James Thew",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSoraBold20)),
                                              GestureDetector(
                                                  onTap: () {
                                                    onTapTxtYourprofile(
                                                        context);
                                                  },
                                                  child: Padding(
                                                      padding:
                                                          getPadding(top: 10),
                                                      child: Text(
                                                          "Your profile",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSoraSemiBold14BlueA700)))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgEllipse19,
                                    height: getSize(100.00),
                                    width: getSize(100.00),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(50.00)),
                                    alignment: Alignment.centerLeft,
                                    margin: getMargin(left: 21))
                              ])),
                      Padding(
                          padding: getPadding(left: 23, top: 14),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgHomeGray40001,
                                height: getVerticalSize(18.00),
                                width: getHorizontalSize(20.00),
                                margin: getMargin(top: 1, bottom: 1)),
                            Padding(
                                padding: getPadding(left: 18),
                                child: Text("Home",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 24, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgUserGray40001,
                                height: getVerticalSize(20.00),
                                width: getHorizontalSize(18.00)),
                            Padding(
                                padding: getPadding(left: 18),
                                child: Text("Profile",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 24, top: 12),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgNotificationGray40001,
                                height: getVerticalSize(20.00),
                                width: getHorizontalSize(17.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 19),
                                child: Text("Booking History",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 11),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 24, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgVector,
                                height: getVerticalSize(17.00),
                                width: getHorizontalSize(16.00),
                                margin: getMargin(top: 2, bottom: 1)),
                            Padding(
                                padding: getPadding(left: 21),
                                child: Text("Switch to Services",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 24, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgNotificationGray60002,
                                height: getVerticalSize(20.00),
                                width: getHorizontalSize(17.00),
                                margin: getMargin(top: 1)),
                            Padding(
                                padding: getPadding(left: 19),
                                child: Text("Notifications",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 26, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgCallGray40001,
                                height: getVerticalSize(20.00),
                                width: getHorizontalSize(14.00),
                                margin: getMargin(top: 1)),
                            Padding(
                                padding: getPadding(left: 21),
                                child: Text("Contact",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 23, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgInfo,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(top: 1)),
                            Padding(
                                padding: getPadding(left: 18),
                                child: Text("About",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 23, top: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSignal,
                                height: getVerticalSize(20.00),
                                width: getHorizontalSize(19.00)),
                            Padding(
                                padding: getPadding(left: 18),
                                child: Text("Feedback",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 13),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 21, top: 11),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearchGray40001,
                                height: getSize(25.00),
                                width: getSize(25.00)),
                            Padding(
                                padding: getPadding(left: 15, top: 3),
                                child: Text("Rate our  App",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(350.00),
                              margin: getMargin(top: 9),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00))))),
                      Padding(
                          padding: getPadding(left: 23, top: 15, bottom: 5),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgLocationPink400,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 2)),
                            Padding(
                                padding: getPadding(left: 18, top: 1),
                                child: Text("Logout",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14))
                          ]))
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTxtYourprofile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileTwoScreen);
  }
}
