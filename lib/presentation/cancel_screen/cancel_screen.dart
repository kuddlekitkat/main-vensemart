import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class CancelScreen extends StatelessWidget {
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

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
                    onTap: () => onTapArrowleft(context)),
                title: AppbarSubtitle2(
                    text: "Cancel Service", margin: getMargin(left: 104))),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 13, right: 20, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(346.00),
                          margin: getMargin(right: 4),
                          padding: getPadding(
                              left: 11, top: 12, right: 11, bottom: 12),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgRectangle43,
                                          height: getSize(60.00),
                                          width: getSize(60.00),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(5.00)),
                                          margin: getMargin(top: 5)),
                                      Padding(
                                          padding:
                                              getPadding(left: 12, bottom: 20),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Amarachi",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsMedium16),
                                                Padding(
                                                    padding: getPadding(top: 4),
                                                    child: Text("Hair cut",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSoraSemiBold12))
                                              ]))
                                    ]),
                                Padding(
                                    padding: getPadding(
                                        top: 15, right: 5, bottom: 2),
                                    child: Row(children: [
                                      Container(
                                          width: getHorizontalSize(60.00),
                                          padding: getPadding(
                                              left: 12,
                                              top: 8,
                                              right: 12,
                                              bottom: 8),
                                          decoration: AppDecoration
                                              .txtFillGray50
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .txtRoundedBorder5),
                                          child: Text("Pending",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtSoraSemiBold8)),
                                      Spacer(),
                                      Container(
                                          width: getHorizontalSize(84.00),
                                          padding: getPadding(
                                              left: 18,
                                              top: 7,
                                              right: 18,
                                              bottom: 7),
                                          decoration: AppDecoration
                                              .txtFillDeeporange50
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .txtRoundedBorder5),
                                          child: Text("15 Oct,22",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtSoraSemiBold10)),
                                      Container(
                                          width: getHorizontalSize(105.00),
                                          margin: getMargin(left: 8),
                                          padding: getPadding(
                                              left: 13,
                                              top: 7,
                                              right: 13,
                                              bottom: 7),
                                          decoration: AppDecoration
                                              .txtFillBlueA700b2
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .txtRoundedBorder5),
                                          child: Text("8:30am to 9:30",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSoraSemiBold10WhiteA700))
                                    ]))
                              ])),
                      Container(
                          width: getHorizontalSize(271.00),
                          margin: getMargin(top: 32),
                          child: Text(
                              "To serve you better kindly select a reason\nwhy you are canceling the requested service",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtPoppinsMedium12)),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text("Reason for cancellation",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium15)),
                      CustomDropDown(
                          width: 346,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 13),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgVectorBlack900)),
                          hintText: "Select your reason",
                          margin: getMargin(top: 17),
                          items: dropdownItemList,
                          onChanged: (value) {}),
                      CustomButton(
                          height: 48,
                          width: 265,
                          text: "Cancel Booking",
                          margin: getMargin(top: 61, bottom: 5),
                          shape: ButtonShape.Square,
                          fontStyle: ButtonFontStyle.PoppinsMedium14)
                    ]))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
