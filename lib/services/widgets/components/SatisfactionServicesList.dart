import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  State<SatisfactionServicesList> createState() =>
      _SatisfactionServicesListState();
}

class _SatisfactionServicesListState extends State<SatisfactionServicesList> {
  ProviderServices? providerServices;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.trendingServices();
    super.initState();
  }

  // Widget Container(){
  //
  //   return Row(
  //     children: [
  //       Container(
  //   height: 100,
  //   width: 40,
  //   decoration: const BoxDecoration(
  //       image: DecorationImage(
  //           image: AssetImage(
  //               'assets/images/servicescheckmark.png'))),
  // ),
  // Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Text(
  //       'Your Satisfaction is guaranteed',
  //       style: TextStyle(
  //           fontSize: 16.0,
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold),
  //     ),
  //     Container(
  //         margin:EdgeInsets.only(right: 10),
  //         width: 200,
  //         child: Text(
  //           'Our Service providers are trained professionals that are well vetted and verified by our team of excellent service and sector leaders',
  //           maxLines: 5, style: TextStyle(
  //           fontSize: 10.0, color: Colors.white, ),
  //         )),
  //   ],
  // ),
  //     ],
  //   );
  // }
  //

  List images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
            height: 230.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 1000,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.cover,
                    )),
              );
            },
          );
        }).toList(),
      ),
    );

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

  listWidget({imageUrl, text, id}) {
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
                            Image.asset('assets/images/worker-image.jpeg'),
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
