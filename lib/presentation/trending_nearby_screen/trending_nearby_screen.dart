import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../trending_nearby_screen/widgets/listrectanglenineteen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';

class TrendingNearbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              decoration: AppDecoration.fillGray50,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomAppBar(
                                        height: getVerticalSize(32),
                                        leadingWidth: 54,
                                        leading: CustomIconButton(
                                            height: 26,
                                            width: 34,
                                            margin:
                                                getMargin(left: 20, bottom: 6),
                                            onTap: () {
                                              onTapBtnArrowleft(context);
                                            },
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowleft)),
                                        centerTitle: true,
                                        title: Text("Trending Nearby",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtPoppinsSemiBold15),
                                        styleType: Style.bgFillGray50),
                                    Padding(
                                        padding: getPadding(
                                            left: 19,
                                            top: 15,
                                            right: 18,
                                            bottom: 9),
                                        child: ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  height: getVerticalSize(19));
                                            },
                                            itemCount: 6,
                                            itemBuilder: (context, index) {
                                              return ListrectanglenineteenItemWidget(
                                                  onTapImgRectangleNineteen: () =>
                                                      onTapImgRectangleNineteen(
                                                          context),
                                                  onTapBooknow: () =>
                                                      onTapBooknow(context));
                                            }))
                                  ])))
                    ]))));
  }

  onTapImgRectangleNineteen(BuildContext context) {}
  onTapBooknow(BuildContext context) {}
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
