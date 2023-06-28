import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vensemart/products/screens/CategoryScreen.dart';
import 'package:vensemart/products/screens/ShopDetailScreen.dart';
import 'package:vensemart/products/widgets/components/CategoryImage.dart';
import 'package:vensemart/products/widgets/components/FeaturedImage.dart';
import 'package:vensemart/products/widgets/components/TopSellingImage.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../presentation/home_screen_for_product_screen/widgets/gridelectronics_item_widget.dart';
import '../../../presentation/home_screen_for_product_screen/widgets/listellipsethirtytwo_item_widget.dart';
import '../../../presentation/home_screen_for_product_screen/widgets/listrectangletwentythree_item_widget.dart';
import '../../../presentation/home_screen_for_product_screen/widgets/sliderrectangletwentysix_item_widget.dart';
import '../../../services/provider/provider_services.dart';
import '../../../services/screens/AvailableServicesListScreen.dart';
import '../../../services/widgets/components/AppointmentCard.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  State<ProductsHome> createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  ProviderServices? _providerServices;

  int silderIndex = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState

    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.getAllCategories();
    _providerServices?.getAllFeaturedShops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(builder: (_, provider, __) {
      if (provider.productCategory?.data == null) {
        return SpinKitCircle(
          color: Colors.blue[900],
        );
      } else {
        print('we are here');
        return Scaffold(
          backgroundColor: Color.fromRGBO(234, 234, 234, 2),
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
                                padding:
                                    getPadding(left: 10, top: 2, right: 102),
                                child: Text("what are your looking for?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRubikRomanRegular15))
                          ])),
                      Container(
                          height: getVerticalSize(118.00),
                          width: getHorizontalSize(350.00),
                          margin: getMargin(left: 1, top: 28),
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
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
                                                activeDotColor:
                                                    ColorConstant.pink400,
                                                dotColor:
                                                    ColorConstant.whiteA7007f,
                                                dotHeight:
                                                    getVerticalSize(11.00),
                                                dotWidth:
                                                    getHorizontalSize(11.00)))))
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
                                      mainAxisSpacing: getHorizontalSize(15.00),
                                      crossAxisSpacing:
                                          getHorizontalSize(15.00)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider.productCategory?.data?.length,
                              itemBuilder: (context, index) {
                                return GridelectronicsItemWidget(
                                    id:
                                        '${provider.productCategory?.data?[index].id}',
                                    categoryName:
                                        '${provider.productCategory?.data?[index].categoryName}',
                                    imageName:
                                        '${provider.productCategory?.data?[index].categoryIcon}');
                              })),

                      // Padding(
                      //     padding: getPadding(left: 1, top: 15),
                      //     child: Text("Top selling",
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtPoppinsSemiBold15)),
                      // Padding(
                      //     padding: getPadding(top: 12, right: 1),
                      //     child: ListView.separated(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         shrinkWrap: true,
                      //         separatorBuilder: (context, index) {
                      //           return SizedBox(height: getVerticalSize(9.00));
                      //         },
                      //         itemCount: 3,
                      //         itemBuilder: (context, index) {
                      //           return ListrectangletwentythreeItemWidget(
                      //               onTapRowrectangletwentythree: () =>
                      //                   onTapRowrectangletwentythree(context));
                      //         })),


                      // Padding(
                      //     padding: getPadding(top: 35),
                      //     child: Text("Featured Shops",
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtPoppinsSemiBold15)),
                      // Padding(
                      //     padding: getPadding(top: 8, right: 1),
                      //     child: ListView.separated(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         shrinkWrap: true,
                      //         separatorBuilder: (context, index) {
                      //           return SizedBox(height: getVerticalSize(12.00));
                      //         },
                      //         itemCount: 2,
                      //         itemBuilder: (context, index) {
                      //           return ListellipsethirtytwoItemWidget();
                      //         }))
                    ]),
              ),
            ),
          ),
        );
      }
    });
  }

  contentContainer({int? homeId, String? text, String? image}) => ClipRRect(
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
                      builder: (context) => CategoryScreen(
                            categoryId: homeId.toString(),
                          )));
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

  featuredContainer({int? homeId, String? text, String? image}) => ClipRRect(
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
                    builder: (context) =>
                        ShopDetailScreen(id: homeId.toString())),
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

  onTapRowrectangletwentythree(BuildContext context) {}
}
