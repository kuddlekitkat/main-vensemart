import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_button.dart';

// ignore: must_be_immutable
class SliderrectangletwentysixItemWidget extends StatelessWidget {
  SliderrectangletwentysixItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillPink400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle26,
              height: getVerticalSize(
                118.00,
              ),
              width: getHorizontalSize(
                177.00,
              ),
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  getHorizontalSize(
                    10.00,
                  ),
                ),
                bottomLeft: Radius.circular(
                  getHorizontalSize(
                    10.00,
                  ),
                ),
              ),
            ),
            CustomButton(
              height: 17,
              width: 50,
              text: "Get started",
              margin: getMargin(
                left: 6,
                top: 50,
                bottom: 51,
              ),
              variant: ButtonVariant.FillWhiteA700,
              shape: ButtonShape.RoundedBorder8,
              padding: ButtonPadding.PaddingAll3,
              fontStyle: ButtonFontStyle.SoraSemiBold6,
            ),
            Padding(
              padding: getPadding(
                left: 2,
                top: 8,
                right: 9,
                bottom: 36,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "COMPUTER",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSoraSemiBold14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Text(
                      "ACCESSORIES",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSoraSemiBold14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                      right: 20,
                    ),
                    child: Text(
                      "Deal like no other",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSoraSemiBold6,
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      96.00,
                    ),
                    margin: getMargin(
                      top: 4,
                    ),
                    child: Text(
                      "Enjoy amazing offer on our projects on\nall purchases made during weekes. up to 35% discount",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtSoraRegular5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
