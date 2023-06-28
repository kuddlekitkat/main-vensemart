import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
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
                    onTap: () => onTapArrowleft1(context)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Notifications")),
            body: Container(
                width: size.width,
                padding: getPadding(left: 19, top: 16, right: 19, bottom: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(45.00),
                          width: getHorizontalSize(351.00),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 1),
                                    padding: getPadding(
                                        left: 51,
                                        top: 12,
                                        right: 51,
                                        bottom: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "You booking was successfully submitted",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsMedium10))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.tealA700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getHorizontalSize(10.00)),
                                            bottomLeft: Radius.circular(
                                                getHorizontalSize(10.00)))),
                                    child: Container(
                                        height: getVerticalSize(45.00),
                                        width: getHorizontalSize(80.00),
                                        padding: getPadding(
                                            left: 30,
                                            top: 10,
                                            right: 30,
                                            bottom: 10),
                                        decoration: AppDecoration.fillTealA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL10),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgNotification,
                                              height: getVerticalSize(23.00),
                                              width: getHorizontalSize(20.00),
                                              alignment: Alignment.center)
                                        ]))))
                          ])),
                      Container(
                          height: getVerticalSize(46.00),
                          width: getHorizontalSize(351.00),
                          margin: getMargin(top: 10),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 1),
                                    padding: getPadding(
                                        left: 94,
                                        top: 12,
                                        right: 94,
                                        bottom: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "You have cancel your booking",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsMedium10))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.pink400,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getHorizontalSize(10.00)),
                                            bottomLeft: Radius.circular(
                                                getHorizontalSize(10.00)))),
                                    child: Container(
                                        height: getVerticalSize(46.00),
                                        width: getHorizontalSize(79.00),
                                        padding: getPadding(
                                            left: 29,
                                            top: 10,
                                            right: 29,
                                            bottom: 10),
                                        decoration: AppDecoration.fillPink400
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL10),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgNotification,
                                              height: getVerticalSize(23.00),
                                              width: getHorizontalSize(20.00),
                                              alignment: Alignment.topRight)
                                        ]))))
                          ])),
                      Container(
                          height: getVerticalSize(46.00),
                          width: getHorizontalSize(351.00),
                          margin: getMargin(top: 11),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 1),
                                    padding: getPadding(
                                        left: 85,
                                        top: 12,
                                        right: 85,
                                        bottom: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "Amarachi approved your booking",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsMedium10))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.tealA700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getHorizontalSize(10.00)),
                                            bottomLeft: Radius.circular(
                                                getHorizontalSize(10.00)))),
                                    child: Container(
                                        height: getVerticalSize(46.00),
                                        width: getHorizontalSize(79.00),
                                        padding: getPadding(
                                            left: 29,
                                            top: 10,
                                            right: 29,
                                            bottom: 10),
                                        decoration: AppDecoration.fillTealA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL10),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgNotification,
                                              height: getVerticalSize(23.00),
                                              width: getHorizontalSize(20.00),
                                              alignment: Alignment.centerRight)
                                        ]))))
                          ])),
                      Container(
                          height: getVerticalSize(45.00),
                          width: getHorizontalSize(351.00),
                          margin: getMargin(top: 11, bottom: 5),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 1),
                                    padding: getPadding(
                                        left: 94,
                                        top: 12,
                                        right: 94,
                                        bottom: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "John reschedule your booking",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsMedium10))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.pink400,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getHorizontalSize(10.00)),
                                            bottomLeft: Radius.circular(
                                                getHorizontalSize(10.00)))),
                                    child: Container(
                                        height: getVerticalSize(45.00),
                                        width: getHorizontalSize(79.00),
                                        padding: getPadding(
                                            left: 29,
                                            top: 9,
                                            right: 29,
                                            bottom: 9),
                                        decoration: AppDecoration.fillPink400
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL10),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgNotification,
                                              height: getVerticalSize(23.00),
                                              width: getHorizontalSize(20.00),
                                              alignment: Alignment.topRight)
                                        ]))))
                          ]))
                    ]))));
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
