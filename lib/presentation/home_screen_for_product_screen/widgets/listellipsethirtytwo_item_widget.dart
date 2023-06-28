import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class ListellipsethirtytwoItemWidget extends StatelessWidget {
  ListellipsethirtytwoItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: ColorConstant.whiteA700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    10.00,
                  ),
                ),
              ),
              child: Container(
                height: getSize(
                  100.00,
                ),
                width: getSize(
                  100.00,
                ),
                padding: getPadding(
                  all: 14,
                ),
                decoration: AppDecoration.fillWhiteA700.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse32,
                      height: getSize(
                        72.00,
                      ),
                      width: getSize(
                        72.00,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          36.00,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Text(
                "Wrinkles laundry",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold10,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: ColorConstant.whiteA700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    10.00,
                  ),
                ),
              ),
              child: Container(
                height: getSize(
                  100.00,
                ),
                width: getSize(
                  100.00,
                ),
                padding: getPadding(
                  all: 14,
                ),
                decoration: AppDecoration.fillWhiteA700.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse33,
                      height: getSize(
                        72.00,
                      ),
                      width: getSize(
                        72.00,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          36.00,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 4,
              ),
              child: Text(
                "Clark plumbers",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold10,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: ColorConstant.whiteA700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    10.00,
                  ),
                ),
              ),
              child: Container(
                height: getSize(
                  100.00,
                ),
                width: getSize(
                  100.00,
                ),
                padding: getPadding(
                  all: 14,
                ),
                decoration: AppDecoration.fillWhiteA700.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse34,
                      height: getVerticalSize(
                        69.00,
                      ),
                      width: getHorizontalSize(
                        70.00,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          35.00,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Text(
                "Gatget repairs",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
