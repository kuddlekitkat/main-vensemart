import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../provider/provider_services.dart';


class ServiceDetailScreen extends StatefulWidget {
  int? classId;
   ServiceDetailScreen({required this.classId});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {


  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  var mytime;
  var plain;
  String _time = "Not set";







  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }


  ProviderServices? providerServices;
  late String servicename;
  TextEditingController timeController = TextEditingController();

  late DateTime _selectedDate;


  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {

    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.serviceId(widget.classId.toString());
    servicename = providerServices?.serviceIdModel?.data?.name ?? '';
    super.initState();
  }

  void addBooking(context) async {
    if (true) {
      setState(() {});
      providerServices?.addNewBooking(map: {
        "service_provider_id" : widget.classId.toString(),
        "booking_date" : "23-12-2022",
        "booking_time" : "12:30 PM"
      }, context: context);
    }
  }


  late Position position;
  late List<Placemark>  placeMarks;
  TextEditingController addressController = TextEditingController();


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
    return await Geolocator.getCurrentPosition();
  }


  getCurrentLocation  () async {

    determinePosition();
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content:  Text('getting current locaton now, please wait '),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () { },
      ),
    ));

    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    position = newPosition;
    placeMarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placeMarks![0];




    String completeAddress =  '${pMark.subThoroughfare} ${pMark.thoroughfare},${pMark.locality},'
        '${pMark.subAdministrativeArea}  ${pMark.postalCode}';
    addressController.text = completeAddress;

    setAddress(context);

  }


  void setAddress(context) async {
// GeoCode geoCode = GeoCode();
//       final query = nameController.text.trim();
//       var addresses = await geoCode.forwardGeocoding(
//         address:query);
//       // var first = addresses.first;
//       print("${addresses.latitude} : ${addresses.longitude}");
    providerServices?.sendLocation(map: {
      "location": addressController.text.trim(),
      "location_lat": "${position!.latitude}",
      "location_long": "${position!.longitude}",
      "state" : "Abuja",
      // "location_lat": "${addresses.latitude}",
      // "location_long": " ${addresses.longitude}"
    }, context: context);



  }





  //please help me make the date and time dynamic by using the cupertino time picker and date picker



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<ProviderServices>(
        builder: (_, provider, __) {
      print('object ${provider.serviceIdModel?.data}');
      if (provider.serviceIdModel?.data == null) {
        return Center(child: const SpinKitCircle(color: Colors.blue,));
      } else {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /2.4,
                  width: double.infinity,
                  // decoration:   BoxDecoration(
                  //
                  //   image: DecorationImage(
                  //       image: NetworkImage('${provider.serviceIdModel?.data?.serviceProviderImage}'),
                  //       fit: BoxFit.cover
                  //   ),
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: '${provider.serviceIdModel?.data?.serviceProviderImage}',
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                                Navigator.pop(context);
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromRGBO(234, 234, 234, 2),
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.heart,
                                color: Colors.grey,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.upload,
                                color: Colors.grey,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),

              ],

            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  Row(
                    children: [







                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              builder: (BuildContext context) {
                                TextEditingController timeinput = TextEditingController();
                                timeinput.text = '';
                                return StatefulBuilder(
                                  builder: (BuildContext context, StateSetter mystate) {
                                    return SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 2.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            timeinput.text,
                                            style: const TextStyle(
                                              fontSize: 22.0,
                                            ),
                                          ),
                                          const Text(
                                            'Select your convenient time and date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20.0),),
                                          SizedBox(height: 16.0,),


                                          Container(
                                            margin: EdgeInsets.all(12.0),
                                            child: TextFormField(
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    //get today's date
                                                    firstDate: DateTime(2000),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101)
                                                );

                                                if (pickedDate != null) {
                                                  print(
                                                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                                  String formattedDate = DateFormat.yMMMMd().format(
                                                      pickedDate);

                                                  // format date in required form here we use yyyy-MM-dd that means time is removed
                                                  //formatted date output using intl package =>  2022-07-04
                                                  //You can format date as per your need
                                                  mystate(() {
                                                    timeController.text =
                                                        formattedDate;

                                                  });
                                                  setState(() {
                                                    timeController.text =
                                                        formattedDate;

                                                    //set foratted date to TextField value.
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }


                                                //when click we have to show the datepicker
                                              },
                                              controller: timeController,
                                              decoration: InputDecoration(
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  prefixIcon: Text(' '),
                                                  hintText: ' DD-MM-YY',
                                                  suffixIcon: GestureDetector(
                                                      onTap: () =>
                                                          _openDatePicker(
                                                              context),
                                                      child: const Icon(Icons
                                                          .calendar_month)),
                                                  hintStyle: new TextStyle(
                                                      color: Colors.grey[600]),
                                                  fillColor: Color.fromRGBO(
                                                      250, 250, 254, 1)),
                                            ),
                                          ),

                                          SizedBox(height: 4.0,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [


                                              _DatePickerItem(
                                                children: <Widget>[
                                                  const Text('Time Entry h:m:s'),
                                                  CupertinoButton(
                                                    // Display a CupertinoDatePicker in time picker mode.
                                                    onPressed: () =>


                                               DatePicker.showTime12hPicker(context,
                                                            theme: DatePickerTheme(
                                                              containerHeight: 210.0,
                                                            ),
                                                            showTitleActions: true, onConfirm: (time) {
                                                              print('confirm $time');
                                                              _time = '${time.hour}:${time.minute}:20';
                                                              mystate(() {

                                                                // final dateFormat = DateFormat('h:mm a');
                                                                print(DateFormat.jm().format(DateFormat("hh:mm:ss").parse("$_time")));
                                                                // var date = '2022-05-20';
                                                                // var time = _time.trim();




                                                                timeinput.text = DateFormat.jm().format(DateFormat("hh:mm:ss").parse("$_time"));
                                                                // timeinput.text = _time;
                                                              });
                                                              setState(() {
                                                                // final dateFormat = DateFormat('h:mm a');
                                                                // var date = '2022-05-20';
                                                                // var time = _time.trim();

                                                                DateFormat.jm().format(DateFormat("hh:mm:ss").parse("$_time"));

                                                                // timeinput.text = _time;
                                                              });
                                                            }, currentTime: DateTime.now(), locale: LocaleType.en),

                                                    // In this example, the time value is formatted manually.
                                                    // You can use the intl package to format the value based on
                                                    // the user's locale settings.
                                                    child: Text(
                                                      timeinput.text == ''
                                                          ? 'select time'
                                                          : timeinput.text,
                                                      style: const TextStyle(
                                                        fontSize: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],

                                          ),
                                          SizedBox(height: 12.0),


                                          GestureDetector(

                                            onTap: () {
                                              Navigator.pop(context);

                                              if(timeController.text != null && timeinput.text != null){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Consumer<
                                                            ProviderServices>(
                                                          builder: (_, provider,
                                                              __) =>
                                                              ServiceDeliveryDetailScreen(
                                                                  service_name: timeController
                                                                      .text,service_date: timeinput.text, service_id: widget.classId.toString()),
                                                        ),
                                                  ),
                                                );


                                              }else{

                                                ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
                                                  content:  Text('Please fill in date and time for appointment'),
                                                  duration: const Duration(seconds: 10),
                                                  action: SnackBarAction(
                                                    label: 'ACTION',
                                                    onPressed: () { },
                                                  ),
                                                ));


                                              }


                                            },
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(30.0),
                                                color: Colors.blue,
                                              ),
                                              child: Center(child: Text(
                                                'Book now', style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                              });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/17,
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(40.0)
                          ),
                          child: Center(child: Text('Book now',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                        ),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width/4.5,),

                      Container(
                        height: MediaQuery.of(context).size.height/17,
                        width: MediaQuery.of(context).size.width/3,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(234 ,234, 234, 30),
                            borderRadius: BorderRadius.circular(40.0)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Color(0xffFFD700)),
                            Text('4.5(4.5 Reviews)',style: TextStyle(fontSize: 10),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0,),

                  Text('${provider.serviceIdModel?.data?.name}',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                  SizedBox(height: 16.0,),
                  Container(
                      width: 300,
                      child: Text('${provider.serviceIdModel?.data?.categoryName}',style: TextStyle( fontSize: 20, fontWeight: FontWeight.normal),)),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.red,),
                      SizedBox(width: 12.0,),
                      Text('${provider.serviceIdModel?.data?.location}', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 16.0,),


                  // Row(
                  //   children: [
                  //     FaIcon(FontAwesomeIcons.clock),
                  //     SizedBox(width: 12.0,),
                  //     Text('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                  //   ],
                  // ),

                  // SizedBox(height: 16.0,),

                  // Row(
                  //   children: [
                  //     FaIcon(FontAwesomeIcons.circleCheck),
                  //     SizedBox(width: 12.0,),
                  //     Text('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                  //   ],
                  // ),
                  // SizedBox(height: 16.0,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.phone,color: Colors.green,),
                      SizedBox(width: 5.0,),
                      TextButton(
                        onPressed: (){
                          FlutterPhoneDirectCaller.callNumber('${provider.serviceIdModel?.data?.phone}');

                        },
                          child: Text('${provider.serviceIdModel?.data?.phone}',style: TextStyle(fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(height: 10.0,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.star,color: Colors.indigo,),
                      SizedBox(width: 12.0,),
                      Text('Bronze Level Member',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 16.0,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.moneyBill,color: Colors.green,),
                      SizedBox(width: 12.0,),
                      Text('${provider.serviceIdModel?.data?.serviceTypePrice}',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),



                  // Row(
                  //
                  //   children: [
                  //     Icon(Icons.chat,),
                  //     SizedBox(width: 12.0,),
                  //
                  //     Text('chat',style: TextStyle(fontWeight: FontWeight.bold),),
                  //
                  //
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 16.0,),
                  //
                  // Text('Photos',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),


                  // Padding(
                  //   padding: const EdgeInsets.only(right: 4.0,top: 4.0),
                  //   child: Row(
                  //
                  //
                  //     children: [
                  //
                  //
                  //       Container(
                  //         height:MediaQuery.of(context).size.height/3.8,
                  //         width: 200,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(12.0),
                  //             image: DecorationImage(
                  //                 image: AssetImage('assets/images/servicedetail.png')
                  //             )
                  //         ),
                  //       ),
                  //
                  //       Column(
                  //         children: [
                  //
                  //           Container(
                  //             height:MediaQuery.of(context).size.height/8.5,
                  //             width: 120,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(20.0),
                  //                 image: DecorationImage(
                  //                     image: AssetImage('assets/images/servicedetail1.png')
                  //                 )
                  //             ),
                  //           ),
                  //           SizedBox(height: 8.5,),
                  //
                  //           Container(
                  //             height:MediaQuery.of(context).size.height/8.5,
                  //             width: 120,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(20.0),
                  //                 image: DecorationImage(
                  //                     image: AssetImage('assets/images/servicedetail2.png')
                  //                 )
                  //             ),
                  //           ),
                  //
                  //         ],
                  //       )
                  //
                  //     ],
                  //   ),
                  // )

                ],
              ),
            )

          ],
        );

      }
    }
      ),
      ),
    );
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Date',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue,
      ),
      onChange: (index) {
        index = time;
        print(index);
        setState(){
          index =  time;
        }

      },
      onSubmit: (index) {
        print(index);


      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}




// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}



