import '../calendar_screen/widgets/calendar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_image.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: getHorizontalSize(322.00),
              padding: getPadding(top: 20, bottom: 20),
              decoration: AppDecoration.fillWhiteA700
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                        height: getVerticalSize(28.00),
                        title: Row(children: [
                          AppbarImage(
                              height: getSize(28.00),
                              width: getSize(28.00),
                              svgPath: ImageConstant.imgArrowleftBlueA400,
                              margin: getMargin(left: 94),
                              onTap: () => onTapArrowleft2(context)),
                          Padding(
                              padding: getPadding(left: 2, top: 3, bottom: 3),
                              child: Text("Oct. 2022",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtIBMPlexSans16.copyWith(
                                      letterSpacing: getHorizontalSize(0.12))))
                        ]),
                        actions: [
                          AppbarImage(
                              height: getSize(28.00),
                              width: getSize(28.00),
                              svgPath: ImageConstant.imgArrowleftBlueA400,
                              margin: getMargin(left: 3, right: 94))
                        ]),
                    Padding(
                        padding: getPadding(top: 11),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SUN".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtIBMPlexSansBold10.copyWith(
                                      letterSpacing: getHorizontalSize(1.50))),
                              Padding(
                                  padding: getPadding(left: 15),
                                  child: Text("MON".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50)))),
                              Padding(
                                  padding: getPadding(left: 16),
                                  child: Text("TUE".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50)))),
                              Padding(
                                  padding: getPadding(left: 15),
                                  child: Text("WED".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50)))),
                              Padding(
                                  padding: getPadding(left: 15),
                                  child: Text("THU".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50)))),
                              Padding(
                                  padding: getPadding(left: 18),
                                  child: Text("FRI".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50)))),
                              Padding(
                                  padding: getPadding(left: 18),
                                  child: Text("SAT".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtIBMPlexSansBold10
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(1.50))))
                            ])),
                    Container(
                        height: getVerticalSize(193.00),
                        width: getHorizontalSize(272.00),
                        margin: getMargin(top: 16, bottom: 7),
                        child: Stack(alignment: Alignment.center, children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgSelector,
                              height: getVerticalSize(158.00),
                              width: getHorizontalSize(272.00),
                              alignment: Alignment.topCenter),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(left: 7, right: 7),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 6, bottom: 6),
                                                  child: Text("28",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 22,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("29",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 22,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("30",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 26,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("1",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14Gray60001
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Container(
                                                  width: getSize(32.00),
                                                  margin: getMargin(left: 19),
                                                  padding: getPadding(
                                                      left: 11,
                                                      top: 6,
                                                      right: 11,
                                                      bottom: 6),
                                                  decoration: AppDecoration
                                                      .txtOutlineGray400
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .txtCircleBorder16),
                                                  child: Text("2",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14Gray100
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 19,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("3",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14Bluegray900
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 31,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("4",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtIBMPlexSansMedium14Bluegray900
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.22))))
                                            ]),
                                        Padding(
                                            padding: getPadding(top: 16),
                                            child: ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height: getVerticalSize(
                                                          22.00));
                                                },
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return CalendarItemWidget();
                                                }))
                                      ])))
                        ]))
                  ]))
        ])));
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
