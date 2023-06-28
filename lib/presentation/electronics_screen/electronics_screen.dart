import '../electronics_screen/widgets/electronics_item_widget.dart';
import '../electronics_screen/widgets/sliderrectangletwentysix1_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_search_view.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ElectronicsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  int silderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray5001,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: getVerticalSize(844.00),
          width: size.width,
          child: Stack(alignment: Alignment.topRight, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    width: size.width,
                    padding: getPadding(top: 25, bottom: 25),
                    decoration: AppDecoration.fillGray50,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomAppBar(
                              height: getVerticalSize(34.00),
                              leadingWidth: 54,
                              leading: AppbarIconbutton(
                                  svgPath: ImageConstant.imgArrowleft,
                                  margin: getMargin(left: 20),
                                  onTap: () => onTapArrowleft3(context)),
                              centerTitle: true,
                              title: Text("Electronics",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSoraSemiBold15)),
                          CustomSearchView(
                              width: 350,
                              focusNode: FocusNode(),
                              controller: searchController,
                              hintText: "Search ",
                              margin: getMargin(top: 33),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 20, top: 17, right: 10, bottom: 16),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgSearch)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(50.00))),
                          Spacer(),
                          Padding(
                              padding:
                                  getPadding(left: 20, right: 22, bottom: 84),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent:
                                              getVerticalSize(134.00),
                                          crossAxisCount: 3,
                                          mainAxisSpacing:
                                              getHorizontalSize(24.00),
                                          crossAxisSpacing:
                                              getHorizontalSize(24.00)),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return ElectronicsItemWidget(id : 1.toString(),imageName: 'in',price: 1.toString(),title: '2',);
                                  }))
                        ]))),
            Padding(
              padding: getPadding(top: 158),
              child: CarouselSlider.builder(
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
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    return Sliderrectangletwentysix1ItemWidget();
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
