import '../item_details_screen/widgets/item_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                height: getVerticalSize(343.00),
                width: size.width,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle23,
                      height: getVerticalSize(343.00),
                      width: getHorizontalSize(390.00),
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: getPadding(left: 19, right: 12, bottom: 12),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomAppBar(
                                    height: getVerticalSize(34.00),
                                    leadingWidth: 53,
                                    leading: AppbarIconbutton(
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: getMargin(left: 19),
                                        onTap: () => onTapArrowleft4(context)),
                                    actions: [
                                      AppbarIconbutton(
                                          svgPath: ImageConstant.imgFavorite,
                                          margin: getMargin(left: 12)),
                                      AppbarIconbutton1(
                                          svgPath: ImageConstant.imgCart,
                                          margin:
                                              getMargin(left: 15, right: 12),
                                          onTap: () => onTapCart(context))
                                    ]),
                                CustomImageView(
                                    svgPath: ImageConstant.imgUserWhiteA700,
                                    height: getVerticalSize(10.00),
                                    width: getHorizontalSize(46.00),
                                    margin: getMargin(top: 254))
                              ])))
                ])),
            Padding(
                padding: getPadding(left: 19, top: 21, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("iphone 14 pro",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium16),
                      Padding(
                          padding: getPadding(top: 3, bottom: 5),
                          child: Text("King’s phones",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium10BlueA700))
                    ])),
            Container(
                width: getHorizontalSize(351.00),
                margin: getMargin(top: 10),
                child: Text(
                    "A magical new way to interact with iPhone. A vital new safety feature designed to save lives. An innovative 48MP camera for mind-blowing detail. All powered by the ultimate smartphone chip.",
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    style: AppStyle.txtPoppinsRegular9)),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: getPadding(left: 19, top: 16),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Brand:  ",
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(12),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "Apple",
                              style: TextStyle(
                                  color: ColorConstant.blueA700,
                                  fontSize: getFontSize(12),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400))
                        ]),
                        textAlign: TextAlign.left))),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: getPadding(left: 19, top: 11),
                    child: Text("₦ 950,000",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold17))),
            Padding(
                padding: getPadding(top: 11),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: getPadding(top: 5, bottom: 4),
                      child: Text("Quantity",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium12Bluegray700)),
                  CustomIconButton(
                      height: 20,
                      width: 20,
                      margin: getMargin(left: 23, top: 4, bottom: 4),
                      variant: IconButtonVariant.FillBluegray700,
                      shape: IconButtonShape.CircleBorder10,
                      padding: IconButtonPadding.PaddingAll6,
                      child:
                          CustomImageView(svgPath: ImageConstant.imgGroup159)),
                  Padding(
                      padding: getPadding(left: 12, top: 2, bottom: 3),
                      child: Text("1",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18)),
                  CustomIconButton(
                      height: 20,
                      width: 20,
                      margin: getMargin(left: 12, top: 4, bottom: 4),
                      variant: IconButtonVariant.FillBluegray700,
                      shape: IconButtonShape.CircleBorder10,
                      padding: IconButtonPadding.PaddingAll6,
                      child:
                          CustomImageView(svgPath: ImageConstant.imgGroup158)),
                  GestureDetector(
                      onTap: () {
                        onTapTxtGroup168(context);
                      },
                      child: Container(
                          width: getHorizontalSize(176.00),
                          margin: getMargin(left: 26),
                          padding: getPadding(
                              left: 30, top: 4, right: 46, bottom: 4),
                          decoration: AppDecoration.txtFillBlueA700.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.txtCircleBorder16),
                          child: Text("Add to cart",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium12WhiteA700)))
                ])),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: getPadding(left: 19, top: 15),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Similar products from",
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(12),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: " ",
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(12),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: "kings’s phones",
                              style: TextStyle(
                                  color: ColorConstant.blueA700,
                                  fontSize: getFontSize(12),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600))
                        ]),
                        textAlign: TextAlign.left))),
            Container(
                height: getVerticalSize(141.00),
                child: ListView.separated(
                    padding: getPadding(left: 19, top: 8, right: 19),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(26.00));
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ItemDetailsItemWidget();
                    }))
          ]),
        ),
      ),
    );
  }

  onTapArrowleft4(BuildContext context) {
    Navigator.pop(context);
  }

  onTapCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCartScreen);
  }

  onTapTxtGroup168(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCartScreen);
  }
}
