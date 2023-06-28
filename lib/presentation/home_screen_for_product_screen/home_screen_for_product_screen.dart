import '../home_screen_for_product_screen/widgets/gridelectronics_item_widget.dart';
import '../home_screen_for_product_screen/widgets/listellipsethirtytwo_item_widget.dart';
import '../home_screen_for_product_screen/widgets/listrectangletwentythree_item_widget.dart';
import '../home_screen_for_product_screen/widgets/sliderrectangletwentysix_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_image.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_bottom_bar.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreenForProductScreen extends StatelessWidget {
  int silderIndex = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
            height: getVerticalSize(47.00),
            leadingWidth: 46,
            leading: AppbarImage(
                height: getVerticalSize(17.00),
                width: getHorizontalSize(26.00),
                svgPath: ImageConstant.imgMenu,
                margin: getMargin(left: 20, top: 15, bottom: 15)),
            centerTitle: true,
            title: Row(children: [
              AppbarImage(
                  height: getVerticalSize(10.00),
                  width: getHorizontalSize(7.00),
                  svgPath: ImageConstant.imgLocation,
                  margin: getMargin(left: 90, top: 18, bottom: 19)),
              Padding(
                  padding: getPadding(left: 5, top: 17, bottom: 17),
                  child: Text("Garki area 11 Gimbiya Street",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium8))
            ]),
            actions: [
              AppbarIconbutton(
                  svgPath: ImageConstant.imgNotificationBlack900,
                  margin: getMargin(left: 21, top: 6, right: 21, bottom: 7),
                  onTap: () => onTapNotification(context))
            ],
            styleType: Style.bgFillGray50),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(left: 19, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: getMargin(left: 1),
                        padding: getPadding(
                            left: 20, top: 14, right: 20, bottom: 14),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder25),
                        child: Row(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgSearch,
                              height: getSize(17.00),
                              width: getSize(17.00),
                              margin: getMargin(top: 2, bottom: 1)),
                          Padding(
                              padding: getPadding(left: 10, top: 2, right: 102),
                              child: Text("what are your looking for?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRubikRomanRegular15))
                        ])),
                    Container(
                        height: getVerticalSize(118.00),
                        width: getHorizontalSize(350.00),
                        margin: getMargin(left: 1, top: 28),
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: getVerticalSize(118.00),
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    silderIndex = index;
                                  }),
                              itemCount: 1,
                              itemBuilder: (context, index, realIndex) {
                                return SliderrectangletwentysixItemWidget();
                              }),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  height: getVerticalSize(11.00),
                                  margin: getMargin(right: 25, bottom: 8),
                                  child: AnimatedSmoothIndicator(
                                      activeIndex: silderIndex,
                                      count: 1,
                                      axisDirection: Axis.horizontal,
                                      effect: ScrollingDotsEffect(
                                          spacing: 5,
                                          activeDotColor: ColorConstant.pink400,
                                          dotColor: ColorConstant.whiteA7007f,
                                          dotHeight: getVerticalSize(11.00),
                                          dotWidth: getHorizontalSize(11.00)))))
                        ])),
                    Padding(
                        padding: getPadding(left: 1, top: 32),
                        child: Text("Categories",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRubikRomanMedium14)),
                    Padding(
                        padding: getPadding(top: 12, right: 1),
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: getVerticalSize(94.00),
                                    crossAxisCount: 3,
                                    mainAxisSpacing: getHorizontalSize(25.00),
                                    crossAxisSpacing: getHorizontalSize(25.00)),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return GridelectronicsItemWidget(id: 1.toString(), categoryName : 'electronics',imageName: 'imagename');
                            })),
                    Padding(
                        padding: getPadding(left: 1, top: 15),
                        child: Text("Top selling",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold15)),
                    Padding(
                        padding: getPadding(top: 12, right: 1),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(9.00));
                            },
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListrectangletwentythreeItemWidget(
                                  onTapRowrectangletwentythree: () =>
                                      onTapRowrectangletwentythree(context));
                            })),
                    Padding(
                        padding: getPadding(top: 35),
                        child: Text("Featured Shops",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold15)),
                    Padding(
                        padding: getPadding(top: 8, right: 1),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(12.00));
                            },
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return ListellipsethirtytwoItemWidget();
                            }))
                  ]),
            ),
          ),
        ),
        // bottomNavigationBar:
        //     CustomBottomBar(onChanged: (BottomBarEnum type) {}),
      ),
    );
  }

  onTapRowrectangletwentythree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.itemDetailsScreen);
  }

  onTapNotification(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }
}
