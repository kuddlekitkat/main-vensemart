import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';
import 'package:vensemart/services/screens/ServiceDetailScreen.dart';

import '../../screens/AvailableServicesListScreen.dart';

class TrendingServicesList extends StatefulWidget {
  const TrendingServicesList({Key? key}) : super(key: key);

  @override
  State<TrendingServicesList> createState() => _TrendingServicesListState();
}

class _TrendingServicesListState extends State<TrendingServicesList> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.trendingServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      child: Consumer<ProviderServices>(builder: (_, provider, __) {
        if (provider.trendingserviceModel == null ||
            provider.trendingserviceModel!.data!.isEmpty) {
          const CircularProgressIndicator();
        } else {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Row(
                  children: [
                    listWidget(
                        id: provider.trendingserviceModel?.data?[index].id,
                        imageUrl: provider
                            .trendingserviceModel?.data?[index].profile,
                        text: provider
                            .trendingserviceModel?.data?[index].name),
                  ],
                );
              }));

          //  ListView(
          //   // This next line does the trick.
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //     ...provider.trendingserviceModel!.data!
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
          //     //           image: AssetImage('assets/images/Trendingservices1.png'),
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
          //     //           image: AssetImage('assets/images/Trendingservices2.png'),
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
          //     //           image: AssetImage('assets/images/Trendingservices3.png'),
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
          //     //           image: AssetImage('assets/images/Trendingservices4.png'),
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

  listWidget({imageUrl, text,id}) {
    return Card(
      child: Container(
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
                    builder: (context) => ServiceDetailScreen(classId: id),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
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
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(text)
                ],
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}