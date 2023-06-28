import '../services_2_demo_screen/widgets/gridrectanglefifteen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';

class Services2DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray5001,
            appBar: CustomAppBar(
                height: getVerticalSize(33.00),
                leadingWidth: 54,
                leading: CustomIconButton(
                    height: 28,
                    width: 34,
                    margin: getMargin(left: 20, bottom: 5),
                    onTap: () {
                      onTapBtnArrowleft(context);
                    },
                    child:
                        CustomImageView(svgPath: ImageConstant.imgArrowleft)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Services"),
                styleType: Style.bgFillGray50),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        width: size.width,
                        padding: getPadding(
                            left: 17, top: 55, right: 17, bottom: 55),
                        decoration: AppDecoration.fillGray50,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(350.00),
                                  padding: getPadding(
                                      left: 30, top: 15, right: 47, bottom: 15),
                                  decoration: AppDecoration.txtFillWhiteA700
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .txtCircleBorder25),
                                  child: Text("Search for services",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRomanRegular15)),
                              Padding(
                                  padding: getPadding(left: 3, top: 22),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  getVerticalSize(109.00),
                                              crossAxisCount: 3,
                                              mainAxisSpacing:
                                                  getHorizontalSize(25.00),
                                              crossAxisSpacing:
                                                  getHorizontalSize(25.00)),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 6,
                                      itemBuilder: (context, index) {
                                        return GridrectanglefifteenItemWidget();
                                      })),
                              Padding(
                                  padding: getPadding(left: 4, top: 21),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle153,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  CustomButton(
                                                      height: 23,
                                                      width: 100,
                                                      text: "Painter",
                                                      variant: ButtonVariant
                                                          .FillBlack9007f,
                                                      shape: ButtonShape
                                                          .CustomBorderBL10,
                                                      padding: ButtonPadding
                                                          .PaddingAll3,
                                                      alignment: Alignment
                                                          .bottomCenter)
                                                ])),
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle154,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  CustomButton(
                                                      height: 23,
                                                      width: 100,
                                                      text: "Carpenter",
                                                      variant: ButtonVariant
                                                          .FillBlack9007f,
                                                      shape: ButtonShape
                                                          .CustomBorderBL10,
                                                      padding: ButtonPadding
                                                          .PaddingAll3,
                                                      alignment: Alignment
                                                          .bottomCenter)
                                                ])),
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle155,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          padding: getPadding(
                                                              left: 11,
                                                              top: 2,
                                                              right: 11,
                                                              bottom: 2),
                                                          decoration: AppDecoration
                                                              .txtFillBlack9007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCustomBorderBL10),
                                                          child: Text(
                                                              "Fridge Repair",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRubikRomanMedium12)))
                                                ]))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 4, top: 21),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            margin: getMargin(bottom: 1),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle156,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          padding: getPadding(
                                                              left: 20,
                                                              top: 2,
                                                              right: 20,
                                                              bottom: 2),
                                                          decoration: AppDecoration
                                                              .txtFillBlack9007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCustomBorderBL10),
                                                          child: Text(
                                                              "Bricklayer",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRubikRomanMedium12)))
                                                ])),
                                        Container(
                                            height: getVerticalSize(109.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle157,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          height:
                                                              getVerticalSize(
                                                                  24.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    child: Container(
                                                                        height: getVerticalSize(
                                                                            23.00),
                                                                        width: getHorizontalSize(
                                                                            100.00),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                ColorConstant.black9007f,
                                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(getHorizontalSize(10.00)), bottomRight: Radius.circular(getHorizontalSize(10.00)))))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Container(
                                                                        width: getHorizontalSize(
                                                                            52.00),
                                                                        child: Text(
                                                                            "Aluminium \nWindow",
                                                                            maxLines:
                                                                                null,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: AppStyle.txtRubikRomanMedium10)))
                                                              ])))
                                                ])),
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            margin: getMargin(bottom: 1),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle158,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  CustomButton(
                                                      height: 23,
                                                      width: 100,
                                                      text: "CCTV installer",
                                                      variant: ButtonVariant
                                                          .FillBlack9007f,
                                                      shape: ButtonShape
                                                          .CustomBorderBL10,
                                                      padding: ButtonPadding
                                                          .PaddingAll3,
                                                      alignment: Alignment
                                                          .bottomCenter)
                                                ]))
                                      ])),
                              Padding(
                                  padding:
                                      getPadding(left: 4, top: 19, bottom: 251),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle159,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          padding: getPadding(
                                                              left: 15,
                                                              top: 3,
                                                              right: 15,
                                                              bottom: 3),
                                                          decoration: AppDecoration
                                                              .txtFillBlack9007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCustomBorderBL10),
                                                          child: Text(
                                                              "Ac installer",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRubikRomanMedium12)))
                                                ])),
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle1510,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          padding: getPadding(
                                                              left: 19,
                                                              top: 3,
                                                              right: 19,
                                                              bottom: 3),
                                                          decoration: AppDecoration
                                                              .txtFillBlack9007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCustomBorderBL10),
                                                          child: Text("Mechanic",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRubikRomanMedium12)))
                                                ])),
                                        Container(
                                            height: getVerticalSize(108.00),
                                            width: getHorizontalSize(100.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle1511,
                                                      height: getVerticalSize(
                                                          108.00),
                                                      width: getHorizontalSize(
                                                          100.00),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  10.00)),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  100.00),
                                                          padding: getPadding(
                                                              left: 12,
                                                              top: 3,
                                                              right: 12,
                                                              bottom: 3),
                                                          decoration: AppDecoration
                                                              .txtFillBlack9007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCustomBorderBL10),
                                                          child: Text(
                                                              "Dish installer",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRubikRomanMedium12)))
                                                ]))
                                      ]))
                            ]))))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
