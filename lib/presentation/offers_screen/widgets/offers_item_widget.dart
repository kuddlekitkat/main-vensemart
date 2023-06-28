import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class OffersItemWidget extends StatelessWidget {
  OffersItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        76.00,
      ),
      width: getHorizontalSize(
        350.00,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(
                left: 1,
              ),
              padding: getPadding(
                left: 36,
                top: 14,
                right: 36,
                bottom: 14,
              ),
              decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: getHorizontalSize(
                      182.00,
                    ),
                    margin: getMargin(
                      bottom: 3,
                    ),
                    child: Text(
                      "Get 10% discount for new and exiting\ncustomers when you book a service above 3000",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: getPadding(
                left: 20,
                top: 13,
                right: 20,
                bottom: 13,
              ),
              decoration: AppDecoration.fillBlueA700.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Text(
                      "10%",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular30,
                    ),
                  ),
                  Text(
                    "Discount",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular10,
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
