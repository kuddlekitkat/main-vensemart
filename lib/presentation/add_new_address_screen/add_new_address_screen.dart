import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AddNewAddressScreen extends StatelessWidget {
  TextEditingController groupFiftyFiveController = TextEditingController();

  TextEditingController groupFortyNineController = TextEditingController();

  TextEditingController groupFiftyOneController = TextEditingController();

  TextEditingController groupFiftyThreeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 54,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 11, bottom: 11),
                    onTap: () => onTapArrowleft6(context)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Add new Address"),
                actions: [
                  Container(
                      height: getVerticalSize(6.00),
                      margin:
                          getMargin(left: 24, top: 25, right: 24, bottom: 25),
                      child: SmoothIndicator(
                          offset: 0,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                              spacing: 2,
                              activeDotColor: ColorConstant.gray5001,
                              dotHeight: getVerticalSize(6.00),
                              dotWidth: getHorizontalSize(6.00))))
                ]),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 27, top: 29, right: 27, bottom: 29),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 1),
                              child: Text("Address",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtPoppinsRegular10Bluegray700)),
                          CustomTextFormField(
                              width: 333,
                              focusNode: FocusNode(),
                              controller: groupFiftyFiveController,
                              hintText: "Karu Nasarawa Nigeria",
                              margin: getMargin(left: 1, top: 6),
                              variant:
                                  TextFormFieldVariant.UnderLineBluegray700,
                              fontStyle:
                                  TextFormFieldFontStyle.PoppinsRegular10),
                          Container(
                              height: getVerticalSize(48.00),
                              width: getHorizontalSize(333.00),
                              margin: getMargin(left: 2, top: 16),
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            height: getVerticalSize(1.00),
                                            width: getHorizontalSize(158.00),
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .blueGray700))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Text("Postal code",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular10Bluegray700),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 116),
                                                    child: Text("Landmark",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular10Bluegray700))
                                              ]),
                                              Padding(
                                                  padding: getPadding(top: 4),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomTextFormField(
                                                            width: 151,
                                                            focusNode:
                                                                FocusNode(),
                                                            controller:
                                                                groupFortyNineController,
                                                            hintText: "9011101",
                                                            variant:
                                                                TextFormFieldVariant
                                                                    .UnderLineBluegray700,
                                                            fontStyle:
                                                                TextFormFieldFontStyle
                                                                    .PoppinsRegular10,
                                                            textInputType:
                                                                TextInputType
                                                                    .phone),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 24,
                                                                bottom: 13),
                                                            child: Text(
                                                                "9011101",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular10Black900))
                                                      ]))
                                            ]))
                                  ])),
                          Padding(
                              padding: getPadding(left: 1, top: 16, right: 140),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("State",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Bluegray700),
                                    Text("City",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular10Bluegray700)
                                  ])),
                          Padding(
                              padding: getPadding(left: 1, top: 4, right: 2),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextFormField(
                                        width: 151,
                                        focusNode: FocusNode(),
                                        controller: groupFiftyOneController,
                                        hintText: "Nasarawa",
                                        variant: TextFormFieldVariant
                                            .UnderLineBluegray700,
                                        fontStyle: TextFormFieldFontStyle
                                            .PoppinsRegular10),
                                    CustomTextFormField(
                                        width: 158,
                                        focusNode: FocusNode(),
                                        controller: groupFiftyThreeController,
                                        hintText: "Karu",
                                        variant: TextFormFieldVariant
                                            .UnderLineBluegray700,
                                        fontStyle: TextFormFieldFontStyle
                                            .PoppinsRegular10,
                                        textInputAction: TextInputAction.done)
                                  ])),
                          Padding(
                              padding: getPadding(left: 3, top: 16),
                              child: Text("Phone number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtPoppinsRegular10Bluegray700)),
                          Padding(
                              padding: getPadding(left: 2, top: 8),
                              child: Text("08101013370",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular10Black900)),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(333.00),
                              margin: getMargin(left: 3, top: 9, bottom: 5),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueGray700))
                        ]))),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 30, right: 20, bottom: 37),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                      height: 48,
                      width: 340,
                      text: "Save Address",
                      padding: ButtonPadding.PaddingAll14,
                      fontStyle: ButtonFontStyle.PoppinsSemiBold12,
                      onTap: () => onTapSaveaddress(context))
                ]))));
  }

  onTapSaveaddress(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chooseAddressScreen);
  }

  onTapArrowleft6(BuildContext context) {
    Navigator.pop(context);
  }
}
