import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class GridrectangletwentythreeItemWidget extends StatelessWidget {
  GridrectangletwentythreeItemWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle2311,
          height: getSize(
            100.00,
          ),
          width: getSize(
            100.00,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 4,
          ),
          child: Text(
            "Samsung galax...",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsSemiBold10,
          ),
        ),
        Text(
          "₦ 554,000",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsSemiBold10Black900,
        ),
      ],
    );
  }
}
