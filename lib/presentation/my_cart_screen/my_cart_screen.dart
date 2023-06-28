import '../my_cart_screen/widgets/my_cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:vensemart/widgets/app_bar/appbar_image.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_bottom_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class MyCartScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(47.00),
                leadingWidth: 46,
                leading: AppbarImage(
                    height: getVerticalSize(17.00),
                    width: getHorizontalSize(26.00),
                    svgPath: ImageConstant.imgMenu,
                    margin: getMargin(left: 20, top: 15, bottom: 15)),
                centerTitle: true,
                title: Text("My cart",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium17),
                actions: [
                  AppbarIconbutton1(
                      svgPath: ImageConstant.imgNotificationBlack900,
                      margin: getMargin(left: 14, top: 6, right: 14, bottom: 7),
                      onTap: () => onTapNotification1(context))
                ],
                styleType: Style.bgFillGray50),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 13, right: 20, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 2, right: 2),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(7.00));
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return MyCartItemWidget();
                              })),
                      Padding(
                          padding: getPadding(left: 6, top: 20, right: 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Sub total Price Delivery Fee Voucher  Total price",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPoppinsRegular14Black900b2
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.04))),
                                Container(
                                    width: getHorizontalSize(70.00),
                                    margin: getMargin(top: 2),
                                    child: Text(
                                        "₦ 956,300\n₦ 500\nNone\n₦ 956,800",
                                        maxLines: null,
                                        textAlign: TextAlign.right,
                                        style: AppStyle.txtPoppinsBold14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.04))))
                              ])),
                      Spacer(),
                      CustomButton(
                          height: 48,
                          width: 349,
                          text: "Pay Now",
                          margin: getMargin(bottom: 27),
                          fontStyle: ButtonFontStyle.PoppinsMedium14)
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapNotification1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }
}
