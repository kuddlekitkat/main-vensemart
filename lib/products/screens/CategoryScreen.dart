import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/ProductDetailScreen.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_search_view.dart';

import '../../presentation/electronics_screen/widgets/electronics_item_widget.dart';
import '../../presentation/electronics_screen/widgets/sliderrectangletwentysix1_item_widget.dart';
import '../../services/provider/provider_services.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  const CategoryScreen({required this.categoryId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ProviderServices? providerServices;
  TextEditingController searchController = TextEditingController();

  int silderIndex = 1;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.productCate(widget.categoryId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          print('object ${provider.productIdModel?.data}');
          if (provider.productCategoryModel?.data == null) {
            return Center(
                child: provider?.productCategoryModel?.message ==
                        "No Suggested Products Found"
                    ? Container(
                        height: getVerticalSize(844.00),
                        width: size.width,
                        decoration: AppDecoration.fillGray50,
                        child: Stack(alignment: Alignment.topRight, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  width: size.width,
                                  padding: getPadding(top: 25, bottom: 25),
                                  decoration: AppDecoration.fillGray50,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomAppBar(
                                          height: getVerticalSize(34.00),
                                          leadingWidth: 54,
                                          leading: AppbarIconbutton(
                                              svgPath:
                                                  ImageConstant.imgArrowleft,
                                              margin: getMargin(left: 20),
                                              onTap: () =>
                                                  onTapArrowleft3(context)),
                                          centerTitle: true,
                                          title: Text("Products",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtSoraSemiBold15),
                                        ),
                                        CustomSearchView(
                                            width: 350,
                                            focusNode: FocusNode(),
                                            controller: searchController,
                                            hintText: "Search ",
                                            margin: getMargin(top: 33),
                                            prefix: Container(
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 17,
                                                    right: 10,
                                                    bottom: 16),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgSearch)),
                                            prefixConstraints: BoxConstraints(
                                                maxHeight:
                                                    getVerticalSize(20.00))),
                                        Padding(
                                            padding: getPadding(
                                                left: 20,
                                                right: 22,
                                                bottom: 84),
                                            child: Text('No products found'))
                                      ]))),
                        ]),
                      )
                    : SpinKitCircle(
                        color: Colors.blue,
                      ));
          } else {
            return Container(
              height: getVerticalSize(844.00),
              width: size.width,
              decoration: AppDecoration.fillGray50,
              child: Stack(alignment: Alignment.topRight, children: [
                Align(
                    alignment: Alignment.topCenter,
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
                                title: Text("Products",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSoraSemiBold15),
                              ),
                              CustomSearchView(
                                  width: 350,
                                  focusNode: FocusNode(),
                                  controller: searchController,
                                  hintText: "Search ",
                                  margin: getMargin(top: 33),
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 20,
                                          top: 17,
                                          right: 10,
                                          bottom: 16),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgSearch)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(20.00))),
                              Padding(
                                  padding: getPadding(
                                      left: 20, right: 22, bottom: 84),
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
                                      itemCount: provider.productCategoryModel?.data?.length,
                                      itemBuilder: (context, index) {
                                        return ElectronicsItemWidget(

                                          id: '${provider.productCategoryModel?.data?[index].id}',
                                          imageName:
                                              '${provider.productCategoryModel?.data?[index].productImage}',
                                          title:
                                              '${provider.productCategoryModel?.data?[index].productTitle}',
                                          price:
                                              '${provider.productCategoryModel?.data?[index].productPrice}',
                                        );
                                      }))
                            ]))),
                // Padding(
                //   padding: getPadding(top: 158),
                //   child: CarouselSlider.builder(
                //       options: CarouselOptions(
                //           height: getVerticalSize(118.00),
                //           initialPage: 0,
                //           autoPlay: true,
                //           viewportFraction: 1.0,
                //           enableInfiniteScroll: false,
                //           scrollDirection: Axis.horizontal,
                //           onPageChanged: (index, reason) {
                //             silderIndex = index;
                //           }),
                //       itemCount: 2,
                //       itemBuilder: (context, index, realIndex) {
                //         return Sliderrectangletwentysix1ItemWidget();
                //       }),
                // ),
              ]),
            );
          }
        },
      ),
    );
  }

  contentContainer({String? id, String? text, String? image}) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            title: Center(
                child: Text(
              text ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.black54,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    id: id.toString(),
                  ),
                ),
              );
            },
            child: CachedNetworkImage(
              imageUrl: image.toString(),
              fit: BoxFit.cover,
              placeholder: (
                context,
                url,
              ) =>
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: const SpinKitCircle(
                        color: Colors.grey,
                      )),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/worker-image.jpeg'),
            ),
          ),
        ),
      );

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
