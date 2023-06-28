import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';
import 'package:vensemart/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProfileTwoScreen extends StatelessWidget {
  TextEditingController detailOneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController detailFourController = TextEditingController();

  TextEditingController detailFiveController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: getVerticalSize(184.00),
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
                                            decoration:
                                                AppDecoration.fillBlueA700,
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
                                                      margin:
                                                          getMargin(bottom: 53),
                                                      onTap: () {
                                                        onTapBtnArrowleft(
                                                            context);
                                                      },
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowleft))
                                                ]))),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse19,
                                        height: getSize(100.00),
                                        width: getSize(100.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(50.00)),
                                        alignment: Alignment.bottomCenter)
                                  ])),
                          CustomTextFormField(
                              width: 351,
                              focusNode: FocusNode(),
                              controller: detailOneController,
                              hintText: "Aaron Iliya DIkkko",
                              margin: getMargin(top: 19),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 17, top: 16, right: 5, bottom: 16),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgUserGray4000112x12)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44.00))),
                          CustomTextFormField(
                              width: 351,
                              focusNode: FocusNode(),
                              controller: emailController,
                              hintText: "iaarondikko@gmail.com",
                              margin: getMargin(top: 7),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 17, top: 16, right: 5, bottom: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(5.00))),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgVectorGray40001)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44.00))),
                          CustomTextFormField(
                              width: 351,
                              focusNode: FocusNode(),
                              controller: mobileNoController,
                              hintText: "+2348101013370",
                              margin: getMargin(top: 7),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 17, top: 14, right: 6, bottom: 13),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCallGray40001)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44.00))),
                          CustomTextFormField(
                              width: 351,
                              focusNode: FocusNode(),
                              controller: detailFourController,
                              hintText: "Address",
                              margin: getMargin(top: 7),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 17, top: 14, right: 6, bottom: 13),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgLocationGray40001)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44.00))),
                          CustomTextFormField(
                              width: 351,
                              focusNode: FocusNode(),
                              controller: detailFiveController,
                              hintText: "Manage card",
                              margin: getMargin(top: 7, bottom: 5),
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 17, top: 16, right: 3, bottom: 16),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgComputer)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44.00)))
                        ])))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
