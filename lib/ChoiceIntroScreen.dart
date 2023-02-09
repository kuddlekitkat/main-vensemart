import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';
import 'ProductsComingSoon.dart';
import 'firebase_service.dart/firebase_service.dart';

class ChoiceIntroScreen extends StatefulWidget {
  const ChoiceIntroScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceIntroScreen> createState() => _ChoiceIntroScreenState();
}

class _ChoiceIntroScreenState extends State<ChoiceIntroScreen> {
  TextEditingController addressController = TextEditingController();
  ProviderServices? providerServices;

  bool? serviceEnabled = false;
  LocationPermission? permission;
  Position? _position;

  // Future<bool> _isLocationServiceEnabled() async {
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   // print('object $serviceEnabled');
  //   if (!serviceEnabled!) {
  //     log('Location services are disabled.');

  //     await Geolocator.openAppSettings();
  //     return false;
  //   }

  //   _position = await _determinePosition();
  //   return true;
  // }

  /// Requests fir users permission and return there current locations
  Future<LocationPermission?> requestLocationPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return permission;
  }

  Future<Position> _determinePosition(context) async {
    await requestLocationPermission();
    _position = await Geolocator.getCurrentPosition();
    if (_position != null) {
      providerServices?.sendLocation(map: {
        "location": "addressController.text",
        "location_lat": "${_position?.latitude}",
        "location_long": "${_position?.longitude}",
        "state": "sokoto"
      }, context: context);
    }

    setState(() {});
    return _position!;
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    _determinePosition(context);
    firebaseService.firebasePushNotification(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'lat:::...${_position?.latitude} and long:::...${_position?.longitude}');

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Choose your shopping style',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => ProductComingSoonScreen(),
                        ),
                      );
                    },
                    child: Image.asset('assets/images/choicesproduct2.png')),
              ),
              SizedBox(
                width: 12.0,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.blueAccent)),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context!,
                          MaterialPageRoute(
                              builder: (context) => ServicesHomeScreen(),
                              maintainState: true),
                          (Route<dynamic> route) => false);
                    },
                    child: Image.asset('assets/images/ChoicesService.png')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
