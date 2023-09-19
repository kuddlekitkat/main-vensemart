import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/apiservices/validator.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

import '../../ChoiceIntroScreen.dart';
import '../widgets/image_picker_widget.dart';

class ConfirmAddressScreen extends StatefulWidget {
  ConfirmAddressScreen();

  @override
  State<ConfirmAddressScreen> createState() => _ConfirmAddressScreenState();
}

class _ConfirmAddressScreenState extends State<ConfirmAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ninController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? selectedValue;

  final _pickImage = ImagePickerHandler();
  File? fileImage;
  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();
  int intval = 0;

  late Position position;
  late List<Placemark> placeMarks;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);

    // providerServices?.getLocation();

    SchedulerBinding.instance
        .addPostFrameCallback((_) => showAlertDialog(context));
    super.initState();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("YES"),
      onPressed: () {
        getCurrentLocation();

        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Location Disclaimer"),
      content: Text(
          "Vensemart collects location data to get closest service providers around you and tailor notifications and"
          " advertisements to make your experience on the app better, you can always change your location before booking a service,"
          "would you like to proceed?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void setAddress(context) async {
    providerServices?.sendLocation(map: {
      "location": addressController.text.trim(),
      "location_lat": "9.0658",
      "location_long": "7.4287",
      "state": selectedValue.toString()
    }, context: context);

    Navigator.pushReplacement(context!,
        MaterialPageRoute(builder: (context) => const ChoiceIntroScreen()));
  }

  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await getCurrentLocation();
  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }

    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: const Text(
          'Type location in or wait, while we get your current location'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));

    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = newPosition;
    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placeMarks![0];
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.locality},'
        '${pMark.subAdministrativeArea}  ${pMark.postalCode}';
    addressController.text = completeAddress;

    getCurrentLocation();
    setState(() {
      addressController.text = completeAddress;
    });
  }

  void _getImage(BuildContext context) {
    try {
      _pickImage.pickImage(
          context: context,
          file: (file) {
            fileImage = file;
            setState(() {});
          });
    } catch (e) {}
  }

  final List<String> items = [
    'Abuja',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1456f1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                'Address Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5 * MediaQuery.of(context).size.height * 0.01,
                    color: Colors.white),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.0,
                  ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Color.fromRGBO(250,250,254,1),
                  //       borderRadius: BorderRadius.circular(12.0)//<-- SEE HERE
                  //   ),
                  //   margin: EdgeInsets.all(12.0),
                  //   child: Center(
                  //     child: DropdownButtonHideUnderline(
                  //       child: DropdownButton2(
                  //         hint: Text(
                  //           'Select location',
                  //           style: TextStyle(
                  //             fontSize: 20,
                  //             color: Theme
                  //                 .of(context)
                  //                 .hintColor,
                  //           ),
                  //         ),
                  //         items: items
                  //             .map((item) =>
                  //             DropdownMenuItem<String>(
                  //               value: item,
                  //               child: Text(
                  //                 item,
                  //                 style: const TextStyle(
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //             ))
                  //             .toList(),
                  //         value: selectedValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedValue = value as String;
                  //           });
                  //         },
                  //         buttonHeight: 70,
                  //         buttonWidth: 280,
                  //         itemHeight: 50,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintText: 'Enter Address',
                          prefixIcon: IconButton(
                              onPressed: () {
                                getCurrentLocation();
                              },
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.green,
                              )),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250, 250, 254, 1)),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 250, 254, 1),
                        borderRadius: BorderRadius.circular(12.0) //<-- SEE HERE
                        ),
                    margin: EdgeInsets.all(12.0),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            'Select State',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item.toString(),
                                    child: Text(
                                      item.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          // buttonHeight: 70,
                          // buttonWidth: 280,
                          // itemHeight: 50,
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => setAddress(context),
                    child: Consumer<ProviderServices>(
                      builder: (_, value, __) => Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.height / 1.10,
                          decoration: BoxDecoration(
                            color: const Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: value.isLoading == true
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : const Center(
                                  child: Text(
                                    'Proceed',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
