import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class CalendarItemWidget extends StatelessWidget {
  CalendarItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "5",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
            letterSpacing: getHorizontalSize(
              0.22,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 31,
          ),
          child: Text(
            "6",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 31,
          ),
          child: Text(
            "7",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 31,
          ),
          child: Text(
            "8",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 31,
          ),
          child: Text(
            "9",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 26,
          ),
          child: Text(
            "10",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 22,
          ),
          child: Text(
            "11",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtIBMPlexSansMedium14Bluegray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
