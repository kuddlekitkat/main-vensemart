import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:provider/provider.dart';
import 'package:vensemart/services/screens/ServicesGridScreen.dart';
import 'package:vensemart/services/screens/TrendingServicesScreen.dart';
import 'package:vensemart/services/widgets/components/ExploreServicesList.dart';
import 'package:vensemart/services/widgets/components/SatisfactionServicesList.dart';
import 'package:vensemart/services/widgets/components/TrendingServicesList.dart';

import '../../provider/provider_services.dart';

class ServiceHome extends StatefulWidget {
  const ServiceHome({Key? key}) : super(key: key);

  @override
  State<ServiceHome> createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  static const routeName = '/services-home';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ProviderServices? _providerServices;
  ProviderServices? providerServices;
  late Position position;
  late List<Placemark> placeMarks;

  @override
  void initState() {
    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.userDetails();
    providerServices?.referrals();

    // getCurrentLocation().then((value) {

    //   setState(() {
    //      addressController.text;
    //   });
    //   sendLocationAlternate(context);
    // });

    super.initState();
  }

  // void getLocation(){
  //   getCurrentLocation().then((value) {

  //     setState(() {
  //       addressController.text;
  //     });
  //     sendLocationAlternate(context);
  //   });
  // }

  void sendLocationAlternate(context) async {
    providerServices?.sendLocation(map: {
      "location": addressController.text,
      "location_lat": "9.0787",
      "location_long": "7.47018",
      "state": "Abuja"
    }, context: context);
  }

  TextEditingController addressController = TextEditingController();

  // Future<Position?> determinePosition() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     throw Exception('Error');
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }

  // Future<String?> getCurrentLocation  () async {

  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     throw Exception('Error');
  //   }
  //   Position newPosition = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high
  //   );
  //   position = newPosition;
  //   placeMarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
  //   Placemark pMark = placeMarks![0];
  //   String completeAddress =  '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.locality},'
  //       '${pMark.subAdministrativeArea}  ${pMark.postalCode}';
  //   addressController.text = completeAddress;

  // }

  // fetchCurrentLocation(context) async {
  //   print("STARTING LOCATION SERVICE");
  //   Location? location = Location();
  //   location.changeSettings(
  //       accuracy: LocationAccuracy.low, interval: 1000, distanceFilter: 500);
  //   if (await location.hasPermission() == true) {
  //     await location.requestPermission();
  //   }
  //
  //   try {
  //     await location.onLocationChanged.listen((LocationData currentLocation) {
  //       print(currentLocation.latitude);
  //       print(currentLocation.longitude);
  //       var latitude = currentLocation.latitude;
  //       var longitude = currentLocation.longitude;
  //     });
  //   } on PlatformException {
  //     location = null;
  //   }
  // }

  // fetchCurrentLocation() async {
  //
  //   print("STARTING LOCATION SERVICE");
  //   var location = Location();
  //   location.changeSettings(accuracy: LocationAccuracy.POWERSAVE,interval: 1000,distanceFilter: 500);
  //   if (await location.hasPermission() == true) {
  //     await location.requestPermission();
  //   }
  //
  //   try {
  //     await location.onLocationChanged.listen((LocationData currentLocation) {
  //       print(currentLocation.latitude);
  //       print(currentLocation.longitude);
  //       latitude = currentLocation.latitude;
  //       longitude = currentLocation.longitude;
  //     });
  //   } on PlatformException {
  //     location = null;
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(
                                    fontSize: 2.5 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      overflow: TextOverflow.clip,
                                    ),
                                    text:
                                        'Hi ${provider.userDetailsModel?.data?.name}'),
                              ),
                            )),
                        //
                        // Text(
                        //   'Hi ${provider.userDetailsModel?.data?.name ?? ''}',
                        //   style: const TextStyle(
                        //       fontSize: 25.0, fontWeight: FontWeight.w600),
                        // )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('what service do',
                              style: TextStyle(
                                fontSize: 2.0 *
                                    MediaQuery.of(context).size.height *
                                    0.01,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('you need today',
                              style: TextStyle(
                                fontSize: 2.0 *
                                    MediaQuery.of(context).size.height *
                                    0.01,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: InkWell(
                            onTap: () {
                              // getLocation();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServicesGridScreen()),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff1456f1),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: const Center(
                                  child: Text(
                                'get started',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/servicehomebg.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore our services',
                        style: TextStyle(
                            fontSize:
                                1.0 * MediaQuery.of(context).size.height * 0.01,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServicesGridScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'See more',
                              style: TextStyle(
                                  fontSize: 1.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ExploreServicesList(),
                SizedBox(
                  width: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending around me',
                        style: TextStyle(
                            fontSize:
                               1.3 * MediaQuery.of(context).size.height * 0.01,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrendingServicesScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'View',
                              style: TextStyle(
                                  fontSize:1.3 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TrendingServicesList(),
                SatisfactionServicesList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
