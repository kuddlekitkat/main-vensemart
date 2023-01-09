import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';

import '../../screens/ServiceDeliveryDetailScreen.dart';

class TrendingServicesCard extends StatefulWidget {
  final String image;
  final String jobs;
  final String name;
  final String services;
  final int redStars;
  final int blackStars;




  TrendingServicesCard({required this.image, required this.jobs,required this.name,required this.services,required this.redStars,required this.blackStars});

  @override
  State<TrendingServicesCard> createState() => _TrendingServicesCardState();
}

class _TrendingServicesCardState extends State<TrendingServicesCard> {

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
      height: MediaQuery.of(context).size.height/6.2,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width/4,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                ),
                image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover
                )
            ),
          ),

          Container(
            height: 150,
            width: 270,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(widget.name,style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text(widget.services, maxLines: 5,style: TextStyle(fontSize: 12,color: Colors.black),),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.red,size: 10,),
                          Text("Abuja ",style: TextStyle(fontSize: 10,color: Colors.black),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("*" * widget.redStars,style: TextStyle(fontSize: 10,color: Colors.red),),
                          Text("*" * widget.blackStars,style: TextStyle(fontSize: 10,color: Colors.black),),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Jobs Completed",style: TextStyle(fontSize: 10,color: Colors.black),),
                          Text(widget.jobs,style: TextStyle(fontSize: 10,color: Colors.black),),
                        ],
                      ),
                     SizedBox(height: 12.0,),

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
                             builder: (context) {
                               return SizedBox(
                                 height: MediaQuery.of(context).size.height/2.5,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[

                                     Text('Select your convenient time and date',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10.0),),
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
                                                     print(time);
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
                                             color: Colors.blueAccent,
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
                         height: 30,
                         width: 100,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30.0),
                           color: Colors.blue,
                         ),
                         child: Center(child: Text('Book now',style: TextStyle(color: Colors.white,fontSize: 12),)),
                       ),
                     )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
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

