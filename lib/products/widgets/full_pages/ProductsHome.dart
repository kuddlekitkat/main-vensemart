import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/CategoryScreen.dart';
import 'package:vensemart/products/screens/ShopDetailScreen.dart';
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
    _providerServices?.getAllFeaturedShops();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<ProviderServices>(builder: (_, provider, __) {
      if (provider.productCategory?.data == null ) {
        return SpinKitCircle(
          color: Colors.blue[900],
        );
      } return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 2),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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


                // FeaturedShops(),

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
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: <Widget>[

                        ...provider.productCategory!.data!

                            .map((e) {
                          print('print e for me $e');

                          return contentContainer(image: e.categoryIcon,text: e.categoryName,homeId: e.id);
                        }).toList()
                    ],
                  ),
                ),

                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Featured Shops',
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
                    // padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: <Widget>[

                      ...provider.featuredShopModel!.data!
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

                        return featuredContainer(image: e.storeImage,text: e.storeName,homeId: e.id);
                      }).toList()
                    ],
                  ),
                ),


                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),

      ),
    );
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
                  builder: (context) => CategoryScreen(categoryId: homeId.toString(),)));
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
              builder: (context) => ShopDetailScreen(id : homeId.toString())),

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
