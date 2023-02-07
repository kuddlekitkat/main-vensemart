import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/apiservices/validator.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

import '../widgets/image_picker_widget.dart';

class AddAddressScreen extends StatefulWidget {
  String service_name;
  String service_id;
  String service_date;
   AddAddressScreen({required this.service_name,required this.service_id, required this.service_date});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

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

  _formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.userLocation();
    nameController.text = providerServices?.userLocationModel?.data?.location ?? '';
    super.initState();
  }

  void setAddress(context) async {
// GeoCode geoCode = GeoCode();
//       final query = nameController.text.trim();
//       var addresses = await geoCode.forwardGeocoding(
//         address:query);
//       // var first = addresses.first;
//       print("${addresses.latitude} : ${addresses.longitude}");
      providerServices?.sendLocation(map: {
        "location": nameController.text.trim(),
        "location_lat": "9.0658",
        "location_long": "7.4287",
        "state" : selectedValue.toString()
        // "location_lat": "${addresses.latitude}",
        // "location_long": " ${addresses.longitude}"
      }, context: context);

      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => ServiceDeliveryDetailScreen(service_name: widget.service_name,service_id: widget.service_id, service_date: widget.service_date,),
        ),
      );

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Add Address"),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Form(
          key: _globalFormKey,
          child: Consumer<ProviderServices>(
            builder: (_, provider, __) {
              if (provider.userLocationModel?.message == 'null') {
                return  Center(
                  child: SpinKitCircle(
                    color: Colors.blue[900],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4.0),
                      GestureDetector(
                        onTap: () => _getImage(context),
                        child:
                        // provider.userDetailModel!.data!.profile != null
                        //     ? Center(
                        //         child: CachedNetworkImage(
                        //           imageUrl:
                        //               provider.userDetailModel!.data!.profile!,
                        //           placeholder: (
                        //             context,
                        //             url,
                        //           ) =>
                        //               Container(
                        //                   margin: const EdgeInsets.all(10),
                        //                   child: const SpinKitCircle(
                        //                     color: Colors.grey,
                        //                   )),
                        //           errorWidget: (context, url, error) =>
                        //               const Icon(Icons.error),
                        //         ),
                        //       ):
                        fileImage != null
                            ? Center(
                          // child: CircleAvatar(
                          //     radius: 50,
                          //     backgroundImage: FileImage(fileImage!)),
                        )
                            : const Center(
                          // child: CircleAvatar(
                          //   radius: 50.0,
                          //   backgroundImage:
                          //   AssetImage("assets/images/dp.png"),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Enter Address '),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: nameController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                            label: Text(
                                provider.userLocationModel?.data?.location ?? ''),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),


                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(250, 250, 254, 1),
                            borderRadius: BorderRadius.circular(
                                12.0) //<-- SEE HERE
                        ),
                        margin: EdgeInsets.all(12.0),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Select State',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme
                                      .of(context)
                                      .hintColor,
                                ),
                              ),
                              items: items.map((item) =>
                                  DropdownMenuItem<String>(
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
                              buttonHeight: 70,
                              buttonWidth: 280,
                              itemHeight: 50,
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 14.0),

                      const SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => setAddress(context),
                          child: Consumer<ProviderServices>(
                            builder: (_, value, __) => Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.10,
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
                                    'Set Address',
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
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
