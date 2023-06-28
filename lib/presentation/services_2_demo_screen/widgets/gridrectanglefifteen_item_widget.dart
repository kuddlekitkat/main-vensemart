import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class GridrectanglefifteenItemWidget extends StatelessWidget {
  GridrectanglefifteenItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        108.00,
      ),
      width: getHorizontalSize(
        100.00,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle15,
            height: getVerticalSize(
              108.00,
            ),
            width: getHorizontalSize(
              100.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                10.00,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: getHorizontalSize(
                100.00,
              ),
              padding: getPadding(
                left: 27,
                top: 1,
                right: 27,
                bottom: 1,
              ),
              decoration: AppDecoration.txtFillBlack9007f.copyWith(
                borderRadius: BorderRadiusStyle.txtCustomBorderBL10,
              ),
              child: Text(
                "Cleaner",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRubikRomanMedium12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
