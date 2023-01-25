import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/widgets/components/AvailableServicesBottomListView.dart';
import 'package:vensemart/services/widgets/components/ServiceCard.dart';
import 'package:intl/intl.dart';
import 'package:vensemart/services/widgets/components/TrendingServicesCard.dart';
import '../provider/provider_services.dart';
import 'ServiceDeliveryDetailScreen.dart';

class TrendingServicesScreen extends StatefulWidget {
  static const routeName = '/available-services';



  const TrendingServicesScreen();

  @override
  State<TrendingServicesScreen> createState() => _TrendingServicesScreenState();
}

class _TrendingServicesScreenState extends State<TrendingServicesScreen> {


  ProviderServices? providerServices;
  TextEditingController timeController = TextEditingController();
  TextEditingController controller = TextEditingController();

  late DateTime _selectedDate;
  String _query = '';
  List searchItem = [];

  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {

    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.trendingServices();
    searchItem.clear();

    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 3),
      appBar: AppBar(

        elevation: 0.00,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProviderServices>(
            builder: (_, provider, __) {

              if (provider.trendingserviceModel?.data == null) {
                return Center(child: const CircularProgressIndicator());
              } else {

                return SingleChildScrollView(

                  child: Column(
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(11.0),
                        child: TextFormField(
                          controller: controller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (v) {
                            // searchItem.clear();
                            setState(() => _query = v);
                          },
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
                            hintText: 'Barber',
                            prefixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250,250,254,1),),
                        ),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: ListView(
                          primary: false,
                          padding: const EdgeInsets.all(10),

                          children: <Widget>[
                            if (provider.isReady)

                              ...provider.trendingserviceModel!.data!
                                  .where((element) => element.categoryName!
                                  .toLowerCase()
                                  .contains(_query.toLowerCase()))
                                  .map((e) {
                                    
                                return  TrendingServicesCard(

                                  trendingserviceModel: e,
                                );
                              }).toList()
                          ],
                        ),
                      ),
                    ],
                  ),

                  // AvailableServicesBottomListView(),

                );



              }





            }),
      ),
    );




  }


  contentContainer({String? homeId,String? name, String? image,String? location}) => Container(
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0,),
        Container(
          height: MediaQuery.of(context).size.height - 670,
          width: MediaQuery.of(context).size.width - 270,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
            ),

          ),
          child: CachedNetworkImage(
            imageUrl: image.toString(),
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
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(width: 1,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 8,),

                  // SizedBox(height: 2,),
                  // Text("Haircut",style: TextStyle(fontSize: 15,color: Colors.grey[700]),),
                  // SizedBox(height: 2,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(Icons.location_on,color: Colors.red,size: 15,),
                  //     Text(location.toString(),style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
                  //   ],
                  // ),
                  // SizedBox(height: 2,),
                  // Row(
                  //   children: [
                  //     Text("*****" ,style: TextStyle(fontSize: 20,color: Colors.red),),
                  //     Text("****",style: TextStyle(fontSize: 20,color: Colors.black),),
                  //   ],
                  // ),
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
                      child: Column(
                        children: [
                          Text("N1000 ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text(name.toString(),style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),),
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
                                        Text(
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
                                                String formattedDate = DateFormat(
                                                    'yyyy-MM-dd').format(
                                                    pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2022-07-04
                                                //You can format date as per your need
                                                mystate(() {
                                                  timeController.text =
                                                      formattedDate;
                                                });
                                                setState(() {
                                                  timeController.text =
                                                      formattedDate; //set foratted date to TextField value.
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
                                                    child: Icon(Icons
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
                                                const Text('Time Entry'),
                                                CupertinoButton(
                                                  // Display a CupertinoDatePicker in time picker mode.
                                                  onPressed: () =>
                                                      _showDialog(
                                                          Scaffold(
                                                            body: Container(
                                                                padding: const EdgeInsets
                                                                    .all(15),
                                                                height: 150,
                                                                child: Center(
                                                                    child: TextField(
                                                                      controller: timeinput,
                                                                      //editing controller of this TextField
                                                                      decoration: const InputDecoration(
                                                                          icon: Icon(
                                                                              Icons
                                                                                  .timer),
                                                                          //icon of text field
                                                                          labelText: "Enter Time" //label text of field
                                                                      ),
                                                                      readOnly: true,
                                                                      //set it true, so that user will not able to edit text
                                                                      onTap: () async {
                                                                        TimeOfDay? pickedTime = await showTimePicker(
                                                                          initialTime: TimeOfDay
                                                                              .now(),
                                                                          context: context,
                                                                        );

                                                                        if (pickedTime !=
                                                                            null) {
                                                                          print(
                                                                              pickedTime
                                                                                  .format(
                                                                                  context)); //output 10:51 PM
                                                                          DateTime parsedTime = DateFormat
                                                                              .jm()
                                                                              .parse(
                                                                              pickedTime
                                                                                  .format(
                                                                                  context)
                                                                                  .toString());
                                                                          //converting to DateTime so that we can further format on different pattern.
                                                                          print(
                                                                              parsedTime); //output 1970-01-01 22:53:00.000
                                                                          String formattedTime = DateFormat(
                                                                              'HH:mm:ss')
                                                                              .format(
                                                                              parsedTime);
                                                                          print(
                                                                              formattedTime); //output 14:59:00

                                                                          mystate(() {
                                                                            timeinput
                                                                                .text =
                                                                                formattedTime;
                                                                          });
                                                                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                                                                          setState(() {
                                                                            timeinput
                                                                                .text =
                                                                                formattedTime;

                                                                            //set the value of text field.
                                                                          });
                                                                        } else {
                                                                          print(
                                                                              "Time is not selected");
                                                                        }
                                                                      },
                                                                    )
                                                                )
                                                            ),
                                                          )
                                                      ),
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
                                                    Consumer<
                                                        ProviderServices>(
                                                      builder: (_, provider,
                                                          __) =>
                                                          ServiceDeliveryDetailScreen(
                                                              service_name: timeController
                                                                  .text,service_date: timeinput.text,service_id: homeId.toString()),
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
                ],
              ),
            ],
          ),
        ),
      ],
    ),

  );

}


void _openTimePicker(BuildContext context) {
  BottomPicker.time(
    title: 'Set your next meeting time',
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.orange,
    ),
    onSubmit: (index) {
      print(index);
    },
    onClose: () {
      print('Picker closed');
    },
    bottomPickerTheme: BottomPickerTheme.orange,
    use24hFormat: true,
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







