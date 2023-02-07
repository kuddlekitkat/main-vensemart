import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/models/get_all_trending_services_model.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';

import '../../provider/provider_services.dart';
import '../../screens/ServiceDeliveryDetailScreen.dart';

class TrendingServicesCard extends StatefulWidget {
  // final String image;
  // final String jobs;
  // final String name;
  // final String services;
  // final int redStars;
  // final int blackStars;

  final  Data? trendingserviceModel;




  const TrendingServicesCard({ required this.trendingserviceModel});

  @override
  State<TrendingServicesCard> createState() => _TrendingServicesCardState();
}

class _TrendingServicesCardState extends State<TrendingServicesCard> {

  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  String _time = "Not set";
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);
  TextEditingController timeController = TextEditingController();






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


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height - 640,
            width: MediaQuery.of(context).size.width - 280,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),

            ),
            child: CachedNetworkImage(
              imageUrl: '${widget.trendingserviceModel?.profile}' ?? 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nz'
                  'c3Nzc3Nzc3Nzc3N//AABEIAHwAcwMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUCAwYBB//'
                  'EADIQAAICAQIDBQYFBQAAAAAAAAABAgMRBBIFITEiQVFSkRMVYXGB0TJCobHBIzRy0vD/xAAVAQEBAAAAAAAAAAAAAAAAAAAAAf/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APuIAAAAAAAANFuroq/HbFPwXNmuPEtK3j2jXziwJYNdd1dqzXOMvkzYAAAAAAAAAAAAAAYXWRqrlObxFIotVr7r20m4Q8qZJ41dmcKU+SWX8ysAAAqPYycZKU'
                  'W010aZccM1ru/pWvtpcn4lMZ02Oq6Fi/LJMDpwF0BFAAAAAAAAAABRcXi462Tf5opr9iET+L3Ky/Yo4dfJvPUgFQAAAYzyXV9AZ0yULoTkm1F5wu8Dpa041xT6pJGRhVNW1QsSwpRUvUzIoAAAAAAAAAAKPi9ezVbl0nHP16EE6LWaWOqrUZPa08qXgUFsHXbOD6xk0VGAAAGUIuc4xj1bwYlvwrSQ2Q1Mm3J5wu5AWMIqEIxXRLCMgCKAAAAAAAAAAAUPF'
                  'oKGsbX5kmy+KTjP92v8EBAABUDp6YKuqEI9IxSOYOpj+FfIivQAAAAAAAAAABqu1FVEc2zUfh3srdRxaT7NENq80ubAtLLIVxcrJKMV3soNdetRqHOP4UsR+RqststlusnKT+LMCoAAAdBotXXfXFbsWJdqLOfHToFdUCho4lfVhSftI+EvuWem4hRdyb2S8JEEsAAAABhZZGuDnOSUV3sqtVxScsx0/ZXma5/Qj6/Uy1F0lnsReIr+SKB7KTnJyk22+9s8AKgA'
                  'AAAAAAAAAJWm112nwlLdDyy/guNLq69Suw8S74vqc6exlKElKDcZLo0RXUgh6bWwsohKctsmua+IA1e6KfPZ6r7D3RT57PVfYsQBXe6KfPZ6r7EZ0cOWo9g9YlZ5d8eucY+fwLogX8K0Vs5TspblOam3vknuXRrD5fQCBX7os3beI1va8N+1ivH/AFfoZqrhbnsWvhu5cvax721+6foSXwXhzSi9PySaS9pLknnPf8X/AMjK3hGgulJ20b973STnLDy31WenN8v'
                  'iBFqo4bbGcoavMYSUZS3xwm+nrk9r0/DbJquvXQnOXSMbYtv6EqHCtFBT21SW6SlJ+1lmUksJt55vCxnwFHCtDRKM6qFGUW2nubeXjxfwXoBCuq4dTNxs1FiajGTxFtJN4XNLBpVvCXGElqrsTTcX7OWGl157e4tdRw3SamSd1W7s7Mb5JbfDCeMfuYR4ToVWoKjsrH55Z7+Wc9O0+XxwBXp8Lbw9TdF5xidco8923vj48iVptDpNVUrKbbZRfjy/RrJvnwvRz2'
                  '7qpdlJLFkl0afj4pN+OOeSTptPVpalVRFxgu5tv9WBE90U+ez1X2Huinz2eq+xYgCv901Lpbb6r7AsAB//2Q==',
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

          Container(
            height: 100,
            width: 240,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const SizedBox(width: 1,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 8,),
                    Flexible(child: Text('${widget.trendingserviceModel?.name  ?? 'Jake'}' ,style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold,),maxLines: 2),),
                    const SizedBox(height: 2,),
                    Text("${widget.trendingserviceModel?.categoryName ?? 'Barbing' }" ,style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on,color: Colors.red,size: 15,),
                        Text('${widget.trendingserviceModel?.state}'),
                        // Text('${widget.trendingserviceModel?.location  != null ? widget.trendingserviceModel?.location.length > 13  ? '${widget.trendingserviceModel?.location.substring(0, 11)}...' : widget.trendingserviceModel?.location ?? 'Abuja' : widget.trendingserviceModel?.location ?? 'Abuja' }',style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      children: const [
                        Text("**" ,style: TextStyle(fontSize: 20,color: Colors.red),),
                        // Text("" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 0),
                      child: TextButton(onPressed: (){

                      },
                        child: Text("${widget.trendingserviceModel?.serviceTypePrice}",style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold),),),
                    ),


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
                                          const SizedBox(height: 16.0,),


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
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600]),
                                                  fillColor: const Color.fromRGBO(
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
                                                            theme: const DatePickerTheme(
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
                                          const SizedBox(height: 12.0),


                                          GestureDetector(

                                            onTap: () {
                                              Navigator.pop(context);
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
                                                                    .text,service_date: timeinput.text,service_id: widget.trendingserviceModel.toString()),
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(30.0),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(child: Text(
                                                'Book now', style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            });;
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
      index;
      print(index);
      setState(){
        index;
      }

    },
    onSubmit: (index) {
      print(index);



    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);


}


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

