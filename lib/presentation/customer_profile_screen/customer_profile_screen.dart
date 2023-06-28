import '../customer_profile_screen/widgets/gridrectangletwentythree_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CustomerProfileScreen extends StatelessWidget {
  TextEditingController groupEightyNineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(342.00),
                          width: size.width,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle28,
                                height: getVerticalSize(342.00),
                                width: getHorizontalSize(390.00),
                                alignment: Alignment.center),
                            CustomAppBar(
                                height: getVerticalSize(36.00),
                                leadingWidth: 54,
                                leading: AppbarIconbutton(
                                    svgPath: ImageConstant.imgArrowleft,
                                    margin: getMargin(left: 20, top: 2),
                                    onTap: () => onTapArrowleft9(context)),
                                title: AppbarIconbutton1(
                                    svgPath: ImageConstant.imgFavorite,
                                    margin: getMargin(left: 226)),
                                actions: [
                                  AppbarIconbutton(
                                      svgPath: ImageConstant.imgUpload,
                                      margin: getMargin(
                                          left: 20, right: 20, bottom: 2))
                                ])
                          ])),
                      Container(
                          height: getVerticalSize(30.00),
                          width: getHorizontalSize(348.00),
                          margin: getMargin(top: 28),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 33, top: 2),
                                    child: Text("King’s phone",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSoraSemiBold18))),
                            Align(
                                alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgStar,
                                          height: getSize(22.00),
                                          width: getSize(22.00),
                                          margin: getMargin(top: 2, bottom: 6)),
                                      CustomButton(
                                          height: 30,
                                          width: 118,
                                          text: "4.5 (45 reviews)",
                                          variant:
                                              ButtonVariant.OutlineBluegray100,
                                          shape: ButtonShape.CircleBorder15,
                                          padding: ButtonPadding.PaddingT5,
                                          fontStyle:
                                              ButtonFontStyle.SoraSemiBold10,
                                          prefixWidget: Container(
                                              margin: getMargin(right: 5),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgStarAmber400)))
                                    ]))
                          ])),
                      Container(
                          width: getHorizontalSize(336.00),
                          margin: getMargin(top: 13),
                          child: Text(
                              "Best Mobile is a world-class mobile gadgets and devices sales and services retail store and a one stop shop for everything mobile! We offer the latest and ...",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSoraRegular10)),
                      CustomTextFormField(
                          width: 350,
                          focusNode: FocusNode(),
                          controller: groupEightyNineController,
                          hintText: "Abuja Garki Area 11",
                          margin: getMargin(top: 15),
                          variant: TextFormFieldVariant.UnderLineGray50,
                          padding: TextFormFieldPadding.PaddingT2,
                          fontStyle: TextFormFieldFontStyle.PoppinsSemiBold10,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: getMargin(left: 1, right: 15, bottom: 14),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgCallBlack900)),
                          prefixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(31.00))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 21, top: 10),
                              child: Text("King’s phone store",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtPoppinsMedium16Black900e5))),
                      Padding(
                          padding: getPadding(left: 19, top: 6, right: 16),
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(134.00),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: getHorizontalSize(26.00),
                                      crossAxisSpacing:
                                          getHorizontalSize(26.00)),
                              physics: BouncingScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return GridrectangletwentythreeItemWidget();
                              }))
                    ]))));
  }

  onTapArrowleft9(BuildContext context) {
    Navigator.pop(context);
  }
}
