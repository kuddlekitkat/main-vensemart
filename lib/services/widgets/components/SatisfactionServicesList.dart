import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';
import 'package:vensemart/services/screens/ServiceDetailScreen.dart';

import '../../screens/AvailableServicesListScreen.dart';

class SatisfactionServicesList extends StatefulWidget {
  const SatisfactionServicesList({Key? key}) : super(key: key);

  @override
  State<SatisfactionServicesList> createState() => _SatisfactionServicesListState();
}

class _SatisfactionServicesListState extends State<SatisfactionServicesList> {
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
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      child:
         ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      height: MediaQuery.of(context).size.height / 10.2,
                      width: MediaQuery.of(context).size.width / 1.01,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(20, 85, 249, 2),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Container(
                              height: 140,
                              width: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/servicescheckmark.png'))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Satisfaction is guaranteed',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width / 1.3,
                                    child: Text(
                                      'Our Service providers are trained professionals that are well vetted and verified by our team of excellent service and sector leaders',
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12,)
                  ],
                );
              })),

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


    );
  }

  listWidget({imageUrl, text,id}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
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
                      width: 100,
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