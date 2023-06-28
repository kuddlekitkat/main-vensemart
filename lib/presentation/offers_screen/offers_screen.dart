import '../offers_screen/widgets/offers_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_image.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_bottom_bar.dart';

class OffersScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(
            56.00,
          ),
          leadingWidth: 46,
          leading: AppbarImage(
            height: getVerticalSize(
              17.00,
            ),
            width: getHorizontalSize(
              26.00,
            ),
            svgPath: ImageConstant.imgMenu,
            margin: getMargin(
              left: 20,
              top: 19,
              bottom: 19,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle2(
            text: "Offers",
          ),
        ),
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 19,
                  top: 14,
                  right: 20,
                ),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getVerticalSize(
                        15.00,
                      ),
                    );
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return OffersItemWidget();
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {},
        ),
      ),
    );
  }
}
