import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class Sliderrectangletwentysix1ItemWidget extends StatelessWidget {
  Sliderrectangletwentysix1ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: getMargin(
          left: 712,
        ),
        decoration: AppDecoration.fillBlueA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle26118x177,
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
            Container(
              width: getHorizontalSize(
                50.00,
              ),
              margin: getMargin(
                left: 6,
                top: 50,
                bottom: 51,
              ),
              padding: getPadding(
                left: 7,
                top: 4,
                right: 7,
                bottom: 4,
              ),
              decoration: AppDecoration.txtFillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.txtRoundedBorder8,
              ),
              child: Text(
                "Get started",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyle.txtSoraSemiBold6BlueA700,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 10,
                top: 9,
                right: 8,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "DISCOUNT",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtSoraSemiBold14,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Text(
                      "SALES",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtSoraSemiBold14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Text(
                      "Deal like no other",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtSoraSemiBold6,
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      99.00,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getVerticalSize(
                        11.00,
                      ),
                      margin: getMargin(
                        top: 18,
                        right: 17,
                      ),
                      child: SmoothIndicator(
                        offset: 0,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          spacing: 5,
                          activeDotColor: ColorConstant.blueA700,
                          dotColor: ColorConstant.whiteA7007f,
                          dotHeight: getVerticalSize(
                            11.00,
                          ),
                          dotWidth: getHorizontalSize(
                            11.00,
                          ),
                        ),
                      ),
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
