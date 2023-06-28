import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

import '../../screens/AvailableServicesListScreen.dart';

class ExploreServicesList extends StatefulWidget {
  const ExploreServicesList({Key? key}) : super(key: key);

  @override
  State<ExploreServicesList> createState() => _ExploreServicesListState();
}

class _ExploreServicesListState extends State<ExploreServicesList> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllServiceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      child: Consumer<ProviderServices>(builder: (_, provider, __) {
        if (provider.serviceCategoryModel == null ||
            provider.serviceCategoryModel!.data!.isEmpty) {
          const CircularProgressIndicator();
        } else {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Row(
                  children: [
                    listWidget(
                        id: provider.serviceCategoryModel?.data?[index].id,
                        imageUrl: provider
                            .serviceCategoryModel?.data?[index].categoryIcon,
                        text: provider
                            .serviceCategoryModel?.data?[index].categoryName),
                  ],
                );
              }));

          //  ListView(
          //   // This next line does the trick.
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //     ...provider.serviceCategoryModel!.data!
          //         .map((e) => listWidget(imageUrl: e.categoryIcon))
          //         .toList()
          //     // SizedBox(
          //     //   width: 25.0,
          //     // ),
          //     // InkWell(
          //     //   onTap: () {
          //     //     Navigator.push(
          //     //       context,
          //     //       new MaterialPageRoute(
          //     //         builder: (context) => AvailableServicesListScreen(),
          //     //       ),
          //     //     );
          //     //   },
          //     //   child: Container(
          //     //     height: 120.0,
          //     //     width: 90.0,
          //     //     decoration: BoxDecoration(
          //     //         image: const DecorationImage(
          //     //           image: AssetImage('assets/images/exploreservices1.png'),
          //     //           fit: BoxFit.fill,
          //     //         ),
          //     //         borderRadius: BorderRadius.circular(12.0)),
          //     //   ),
          //     // ),
          //     // SizedBox(
          //     //   width: 25.0,
          //     // ),
          //     // InkWell(
          //     //   onTap: () {
          //     //     Navigator.push(
          //     //       context,
          //     //       new MaterialPageRoute(
          //     //         builder: (context) => AvailableServicesListScreen(),
          //     //       ),
          //     //     );
          //     //   },
          //     //   child: Container(
          //     //     height: 120.0,
          //     //     width: 90.0,
          //     //     decoration: BoxDecoration(
          //     //         image: const DecorationImage(
          //     //           image: AssetImage('assets/images/exploreservices2.png'),
          //     //           fit: BoxFit.fill,
          //     //         ),
          //     //         borderRadius: BorderRadius.circular(12.0)),
          //     //   ),
          //     // ),
          //     // SizedBox(
          //     //   width: 25.0,
          //     // ),
          //     // InkWell(
          //     //   onTap: () {
          //     //     Navigator.push(
          //     //       context,
          //     //       new MaterialPageRoute(
          //     //         builder: (context) => AvailableServicesListScreen(),
          //     //       ),
          //     //     );
          //     //   },
          //     //   child: Container(
          //     //     height: 120.0,
          //     //     width: 90.0,
          //     //     decoration: BoxDecoration(
          //     //         image: const DecorationImage(
          //     //           image: AssetImage('assets/images/exploreservices3.png'),
          //     //           fit: BoxFit.fill,
          //     //         ),
          //     //         borderRadius: BorderRadius.circular(12.0)),
          //     //   ),
          //     // ),
          //     // SizedBox(
          //     //   width: 25.0,
          //     // ),
          //     // InkWell(
          //     //   onTap: () {
          //     //     Navigator.push(
          //     //       context,
          //     //       new MaterialPageRoute(
          //     //         builder: (context) => AvailableServicesListScreen(),
          //     //       ),
          //     //     );
          //     //   },
          //     //   child: Container(
          //     //     height: 40.0,
          //     //     width: 80.0,
          //     //     decoration: BoxDecoration(
          //     //         image: const DecorationImage(
          //     //           image: AssetImage('assets/images/exploreservices4.png'),
          //     //           fit: BoxFit.fill,
          //     //         ),
          //     //         borderRadius: BorderRadius.circular(12.0)),
          //     //   ),
          //     // ),
          //     // SizedBox(
          //     //   width: 12.0,
          //     // ),
          //   ],
          // );

        }
        return Container(
            margin: const EdgeInsets.all(10),
            child: const SpinKitCircle(
              color: Colors.grey,
            ));
      }),
    );
  }

  listWidget({imageUrl, text, id}) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AvailableServicesListScreen(
                    lat: 8.toString(),
                    long: 9.toString(),
                    id: id.toString(),
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize:
                          1.0 * MediaQuery.of(context).size.height * 0.01),
                )
              ],
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
      ),
    );
  }
}
