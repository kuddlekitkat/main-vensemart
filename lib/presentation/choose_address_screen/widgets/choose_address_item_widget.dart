import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class ChooseAddressItemWidget extends StatelessWidget {
  ChooseAddressItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        70.00,
      ),
      width: getHorizontalSize(
        351.00,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: getPadding(
                left: 14,
                top: 13,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgVector17,
                    height: getVerticalSize(
                      5.00,
                    ),
                    width: getHorizontalSize(
                      6.00,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgVector17,
                    height: getVerticalSize(
                      5.00,
                    ),
                    width: getHorizontalSize(
                      6.00,
                    ),
                    margin: getMargin(
                      left: 101,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: getPadding(
                left: 23,
                top: 15,
                right: 23,
                bottom: 15,
              ),
              decoration: AppDecoration.outlineBlack9007f.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Abuja Area 11 Garki 2 Gimbiya Street",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10Gray500,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 4,
                          ),
                          child: Text(
                            "+2348101013370",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium10Bluegray700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgTrashPink400,
                    height: getVerticalSize(
                      16.00,
                    ),
                    width: getHorizontalSize(
                      14.00,
                    ),
                    margin: getMargin(
                      top: 11,
                      bottom: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
