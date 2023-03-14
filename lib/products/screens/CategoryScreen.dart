import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/ProductDetailScreen.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';

import '../../services/provider/provider_services.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  const CategoryScreen({required this.categoryId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.productCate(widget.categoryId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,
      ),
      backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
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
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    fillColor: const Color.fromRGBO(250, 250, 254, 1),
                  ),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 5.5,
              //   width: MediaQuery.of(context).size.width / 1.1,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/proj.png'),
              //     ),
              //     borderRadius: BorderRadius.circular(40.0),
              //   ),
              // ),
              Consumer<ProviderServices>(
                builder: (_, provider, __) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 3,
                            children: <Widget>[
                              if (provider.isPresent)
                                ...provider.productCategory!.data!
                                    .map((e) => contentContainer(
                                        id:e.id.toString(),
                                        text: e.productTitle,
                                        image: e.productImage))
                                    .toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
                  builder: (context) => ProductDetailScreen(id: id.toString(),),
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
