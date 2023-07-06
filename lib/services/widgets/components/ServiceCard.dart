import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart' ;
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/models/service_provider_id_model.dart';
import 'package:vensemart/products/widgets/components/OrderListCard.dart';
import 'package:vensemart/services/screens/AddBookingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';




import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

import '../../../theme/app_style.dart';
import '../../provider/provider_services.dart';

class ServiceCard extends StatefulWidget {
  // final String image;
  // final int redStars;
  // final int blackStars;
  // final String location;

  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  final Data? servicesProviderIdModel;
  ServiceCard({required this.servicesProviderIdModel});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);
  String _time = "Not set";
  TextEditingController timeController = TextEditingController();

  late DateTime _selectedDate;

  TextEditingController _textEditingController = TextEditingController();

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
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


  // void rejectBooking(context) async {
  //   if (true) {
  //    providerServices?.acceptRejectBooking(map: {
  //       "booking_id": widget.servicesProviderIdModel?.id.toString(),
  //       "status": 5.toString()
  //     }, context: context);
  //     Navigator.of(context).popUntil((route) => route.isFirst);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 5.9,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  '${widget.servicesProviderIdModel?.serviceProviderImage}',
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
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: AutoSizeText(
                          '${widget.servicesProviderIdModel?.name}',
                          style: TextStyle(
                            fontSize:
                                1.5 * MediaQuery.of(context).size.height * 0.01,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                          "${widget.servicesProviderIdModel?.categoryName}",
                          style: AppStyle.txtIBMPlexSansMedium14Gray1000),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          '${widget.servicesProviderIdModel?.location != null ? widget.servicesProviderIdModel?.location.length > 13 ? '${widget.servicesProviderIdModel?.location.substring(0, 11)}...' : widget.servicesProviderIdModel?.location : widget.servicesProviderIdModel?.location}',
                          style: AppStyle.txtIBMPlexSansMedium14Gray1000,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.location_on,
                        //   color: Colors.red,
                        //   size: 15,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                              "${'Vensemart Verified service provider' ?? 'Inverter installer'}",
                              style: AppStyle.txtIBMPlexSansMedium14Gray1000),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFDF00),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFDF00),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFDF00),
                        )

                        // Text(
                        //   "*" * 2,
                        //   style: TextStyle(fontSize: 20, color: Colors.red),
                        // ),
                        // Text("*" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.0, vertical: 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "${widget.servicesProviderIdModel?.serviceTypePrice}",
                          style: TextStyle(
                              fontSize: 1.5 *
                                  MediaQuery.of(context).size.height *
                                  0.01,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            builder: (BuildContext context) {
                              TextEditingController timeinput =
                                  TextEditingController();
                              timeinput.text = '';
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter mystate) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        timeinput.text,
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      Text(
                                        'Select your convenient time and date',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(12.0),
                                        child: TextFormField(
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    //get today's date
                                                    firstDate: DateTime(2000),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              print(
                                                  pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                              String formattedDate =
                                                  DateFormat.yMMMMd()
                                                      .format(pickedDate);

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
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none,
                                                ),
                                              ),
                                              filled: true,
                                              prefixIcon: AutoSizeText(' '),
                                              hintText: ' DD-MM-YY',
                                              suffixIcon: GestureDetector(
                                                  onTap: () =>
                                                      _openDatePicker(context),
                                                  child: Icon(
                                                      Icons.calendar_month)),
                                              hintStyle: new TextStyle(
                                                  color: Colors.grey[600]),
                                              fillColor: Color.fromRGBO(
                                                  250, 250, 254, 1)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          _DatePickerItem(
                                            children: <Widget>[
                                              const AutoSizeText(
                                                  'Time Entry h:m:s'),
                                              CupertinoButton(
                                                // Display a CupertinoDatePicker in time picker mode.
                                                onPressed: () => DatePicker
                                                    .showTime12hPicker(context,
                                                        // theme:
                                                        // datePicker
                                                        //     .DatePickerTheme(
                                                        //     containerHeight:
                                                        //     210)
                                                        // DatePickerTheme(
                                                        //   containerHeight:
                                                        //       210.0,
                                                        // ),
                                                        showTitleActions: true,
                                                        onConfirm: (time) {
                                                  print('confirm $time');
                                                  _time =
                                                      '${time.hour}:${time.minute}:20';
                                                  mystate(() {
                                                    // final dateFormat = DateFormat('h:mm a');
                                                    print(DateFormat.jm()
                                                        .format(DateFormat(
                                                                "hh:mm:ss")
                                                            .parse("$_time")));
                                                    // var date = '2022-05-20';
                                                    // var time = _time.trim();

                                                    timeinput.text =
                                                        DateFormat.jm().format(
                                                            DateFormat(
                                                                    "hh:mm:ss")
                                                                .parse(
                                                                    "$_time"));
                                                    // timeinput.text = _time;
                                                  });
                                                  setState(() {
                                                    // final dateFormat = DateFormat('h:mm a');
                                                    // var date = '2022-05-20';
                                                    // var time = _time.trim();

                                                    DateFormat.jm().format(
                                                        DateFormat("hh:mm:ss")
                                                            .parse("$_time"));

                                                    // timeinput.text = _time;
                                                  });
                                                },
                                                        currentTime:
                                                            DateTime.now(),
                                                        locale: LocaleType.en),

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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Consumer<ProviderServices>(
                                                builder: (_, provider, __) =>
                                                    ServiceDeliveryDetailScreen(
                                                        service_name:
                                                            timeController.text,
                                                        service_date:
                                                            timeinput.text,
                                                        service_id:
                                                            '${widget.servicesProviderIdModel?.id}'),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Book now',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width / 3.9,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(40.0)),
                        child: Center(
                            child: Text(
                          'Book now',
                          style: AppStyle.txtRubikRomanMedium12,
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _openDatePicker(BuildContext context) {
  BottomPicker.date(
    title: 'Set your Date',
    dateOrder: DatePickerDateOrder.dmy,
    pickerTextStyle: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 1.5 * MediaQuery.of(context).size.height * 0.01,
    ),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.blue,
    ),
    onChange: (index) {
      index;
      print(index);
      setState() {
        index;
      }
    },
    onSubmit: (index) {
      print(index);
    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);
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
