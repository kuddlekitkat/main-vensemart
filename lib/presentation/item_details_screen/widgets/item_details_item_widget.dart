import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

// ignore: must_be_immutable
class ItemDetailsItemWidget extends StatelessWidget {
  ItemDetailsItemWidget();

  void NotAvailable(context){
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: AutoSizeText('Item not available for now'),
      duration: const Duration(seconds: 10),

    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NotAvailable(context),
      child: IntrinsicWidth(
        child: Padding(
          padding: getPadding(
            right: 26,
          ),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
