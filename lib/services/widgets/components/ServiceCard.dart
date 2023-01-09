
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:vensemart/services/screens/AddBookingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

class ServiceCard extends StatefulWidget {
  final String image;
  final int redStars;
  final int blackStars;
  final String location;

  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

    ServiceCard({required this.image,required this.redStars,required this.blackStars,required this.location});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {

  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);


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
                image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover
                )
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

                SizedBox(width: 1,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 8,),
                    Text("Amarachi",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 2,),
                    Text("Haircut",style: TextStyle(fontSize: 15,color: Colors.grey[700]),),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,color: Colors.red,size: 15,),
                        Text(widget.location,style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Text("*" * widget.redStars,style: TextStyle(fontSize: 20,color: Colors.red),),
                        Text("*" * widget.blackStars,style: TextStyle(fontSize: 20,color: Colors.black),),
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
                        child: Text("N1000 ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),),
                    ),



                    TextButton(onPressed: (){

                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height/2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[

                                  Text('Select your convenient time and date',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0),),
                                  SizedBox(height: 12.0,),
                                  Container(
                                    margin: EdgeInsets.all(12.0),
                                    child: TextFormField(
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
                                          prefixIcon: Text(' '),
                                          hintText: ' DD-MM-YY',
                                          suffixIcon: Icon(Icons.calendar_month),
                                          hintStyle: new TextStyle(color: Colors.grey[600]),
                                          fillColor: Color.fromRGBO(250,250,254,1)),
                                    ),
                                  ),

                                  SizedBox(height: 4.0,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [



                                      _DatePickerItem(
                                        children: <Widget>[
                                          const Text('Time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.00),),
                                          CupertinoButton(
                                            // Display a CupertinoDatePicker in time picker mode.
                                            onPressed: () => _showDialog(
                                              CupertinoDatePicker(
                                                initialDateTime: time,
                                                mode: CupertinoDatePickerMode.time,
                                                use24hFormat: true,
                                                // This is called when the user changes the time.
                                                onDateTimeChanged: (DateTime newTime) {
                                                  setState(() => time = newTime);
                                                },
                                              ),
                                            ),
                                            // In this example, the time value is formatted manually. You can use intl package to
                                            // format the value based on the user's locale settings.
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${time.hour}:${time.minute}',
                                                  style: const TextStyle(
                                                    fontSize: 22.0,
                                                  ),
                                                ),


                                              ],


                                            ),
                                          ),
                                          Container(
                                            height: 30,width: 40,
                                            color: Colors.grey,
                                              child: Center(child: const Text('AM',style: TextStyle(fontWeight: FontWeight.bold,),), )),
                                          Container(
                                              height: 40,width: 50,
                                              color: Colors.blue,
                                              child: Center(child: const Text('PM',style: TextStyle(fontWeight: FontWeight.bold),))),


                                        ],
                                      ),
                                    ],

                                  ),
                                  SizedBox(height: 12.0),



                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ServiceDeliveryDetailScreen(service_name: 'barbing',service_date: 'jack', service_id: 1.toString(),),
                                        ),
                                      );


                                    },
                                    child: Container(
                                        height: MediaQuery.of(context).size.height/17,width: MediaQuery.of(context).size.width/2,
                                        decoration: BoxDecoration(
                                          color: Color(0xff1456f1),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Center(child: const Text('BOOK',style: TextStyle(color: Colors.white),))),
                                  ),

                                ],
                              ),
                            );
                          });

                    },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff1456f1),
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        child: Text("Book NOW ",style: TextStyle(fontSize: 12,color: Colors.white,),),
                      ),),
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
