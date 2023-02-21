import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/widgets/components/CategoryImage.dart';
import 'package:vensemart/products/widgets/components/FeaturedImage.dart';
import 'package:vensemart/products/widgets/components/TopSellingImage.dart';

import '../../../services/provider/provider_services.dart';
import '../../../services/screens/AvailableServicesListScreen.dart';
import '../../../services/widgets/components/AppointmentCard.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  State<ProductsHome> createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  ProviderServices? _providerServices;
  ProviderServices? providerServices;

  @override
  void initState() {
    // TODO: implement initState

    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.getAllCategories();

    // getCurrentLocation().then((value) {

    //   setState(() {
    //      addressController.text;
    //   });
    //   sendLocationAlternate(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 2),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Consumer<ProviderServices>(builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintText: 'what are you looking for',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor: Color.fromRGBO(250, 250, 254, 1),
                    ),
                  ),
                ),

                // Container(
                //   height: MediaQuery.of(context).size.height/5.5,
                //   width:MediaQuery.of(context).size.width/1.1,
                //   decoration: BoxDecoration(
                //
                //     image: DecorationImage(
                //       image: AssetImage('assets/images/proj.png'),
                //     ),
                //     borderRadius: BorderRadius.circular(30.0),
                //   ),
                // ),

                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    )
                  ],
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 1,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: <Widget>[

                        ...provider.productCategory!.data!
                            // .where((element) => element.categoryName!
                            // .toLowerCase()
                            // .contains(_query.toLowerCase()))
                            .map((e) {
                          print('print e for me $e');
                          // if (e.categoryName!
                          //     .toString()
                          //     .toLowerCase()
                          //     .contains(_query.toLowerCase())) {
                          //   searchItem.add(e);
                          //   intval = searchItem.length-1;
                          //   print('int val $intval');

                          //   print(
                          //       'object an image ${searchItem[intval].toJson().toString()}');
                          // }

                          return contentContainer(image: e.categoryIcon,text: e.categoryName);
                        }).toList()
                    ],
                  ),
                ),

                // Column(
                //   children: [
                //
                //     ...provider.productCategory!.data!.map((e) {
                //       print('print e for me $e');
                //
                //       return CategoryImage(image: 'assets/images/choicesproduct.png', name: 'name');
                //
                //
                //     }).toList()
                //
                //
                //
                //
                //   ],
                // ),

                // Column(
                //   children: [
                //
                //     providerServices?.productCategory?.data?.map((e) => Text('hello'))
                //
                //   ],
                // )

                // Column(
                //   children: [
                //
                //   ],
                // )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children:  [
                //     CategoryImage(image: 'assets/images/CatElectronics1.png', name: 'name'),
                //     CategoryImage(image: 'assets/images/CatElectronics2.png', name: 'name'),
                //     CategoryImage(image: 'assets/images/CatElectronics3.png', name: 'name'),
                //
                //   ],
                //
                // ),
                //
                // SizedBox(height: 20.0,),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CategoryImage(image: 'assets/images/catphones2.png', name: 'name'),
                //     CategoryImage(image: 'assets/images/catcomputers.png', name: 'name'),
                //     CategoryImage(image: 'assets/images/catkids.png', name: 'name'),
                //
                //   ],
                //
                // ),
                //
                //
                //

                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(25.0),
                //       child: Text('Top Selling', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                //     )
                //   ],
                // ) ,
                //
                //
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     TopSellingImage(image: 'assets/images/topselling1.png', name: 'headphones', price: 'N12,000'),
                //     TopSellingImage(image: 'assets/images/topselling2.png', name: 'furniture', price: '50,000'),
                //     TopSellingImage(image: 'assets/images/topselling3.png', name: 'Nike shoes', price: '15,000'),
                //
                //   ],
                //
                // ),
                //
                // SizedBox(height: 20.0,),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     TopSellingImage(image: 'assets/images/topselling4.png', name: 'Washing machine', price: 'N160,000'),
                //     TopSellingImage(image: 'assets/images/topselling5.png', name: 'Wristwatch', price: 'N12,000'),
                //     TopSellingImage(image: 'assets/images/topselling6.png', name: 'Ear buds', price: 'N10,000'),
                //
                //   ],
                //
                // ),
                //
                // SizedBox(height: 20.0,),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     TopSellingImage(image: 'assets/images/topselling7.png', name: 'Macbook pro', price: 'N800,000'),
                //     TopSellingImage(image: 'assets/images/topselling8.png', name: 'Itel phone', price: 'N120,000'),
                //     TopSellingImage(image: 'assets/images/topselling9.png', name: 'iPhone 13', price: 'N800,000'),
                //
                //   ],
                //
                // ),
                //
                // SizedBox(height: 20.0,),
                //
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(25.0),
                //       child: Text('Featured shops', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                //     )
                //   ],
                // ) ,
                //
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children:  [
                //     FeaturedImage(image: 'assets/images/featuredshop1.png', name: 'Amarachi salon'),
                //     FeaturedImage(image: 'assets/images/featuredshop2.png', name: 'Nails Salon'),
                //     FeaturedImage(image: 'assets/images/featuredshop3.png', name: 'Tailor'),
                //   ],
                // ),
                // SizedBox(height: 20.0,),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children:  [
                //     FeaturedImage(image: 'assets/images/featuredshop4.png', name: 'Home Decor'),
                //     FeaturedImage(image: 'assets/images/featuredshop5.png', name: 'WD Security'),
                //     FeaturedImage(image: 'assets/images/featuredshop6.png', name: 'happy dry'),
                //   ],
                // ),

                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        }),
      ),
    );
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
                  builder: (context) => AvailableServicesListScreen(
                      lat: 8.toString(),
                      long: 9.toString(),
                      id: homeId.toString()),
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      );
}
