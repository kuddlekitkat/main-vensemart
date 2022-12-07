import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';


class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {


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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /2.4,
                  width: double.infinity,
                  decoration:  BoxDecoration(

                    image: const DecorationImage(
                        image: AssetImage('assets/images/servicedetail.png'),
                        fit: BoxFit.cover
                    ),
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
                              icon: FaIcon(
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
                              builder: (context) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height/2.5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[

                                      Text('Select your convenient time and date',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0),),
                                      SizedBox(height: 16.0,),
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
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                              builder: (context) => ServiceDeliveryDetailScreen(),
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

                  Text('Amarachi beauty hair saloon',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                  SizedBox(height: 16.0,),
                  Container(
                    width: 300,
                      child: Text('Spa Hairsstyling nailfixing haircut Facials Spa Hairsstyling',style: TextStyle( fontSize: 20, fontWeight: FontWeight.normal),)),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 12.0,),
                      Text('Abuja Garki, Area ||', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.clock),
                      SizedBox(width: 12.0,),
                      Text('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                  SizedBox(height: 16.0,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.circleCheck),
                      SizedBox(width: 12.0,),
                      Text('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 16.0,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.phone),
                      SizedBox(width: 12.0,),
                      Text('234809834858,',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 16.0,),

                  Row(

                    children: [
                      Icon(Icons.chat,),
                      SizedBox(width: 12.0,),

                      Text('chat',style: TextStyle(fontWeight: FontWeight.bold),),


                    ],
                  ),

                  SizedBox(height: 16.0,),

                  Text('Photos',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),


                  Padding(
                    padding: const EdgeInsets.only(right: 4.0,top: 4.0),
                    child: Row(


                      children: [


                        Container(
                          height:MediaQuery.of(context).size.height/3.8,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/servicedetail.png')
                              )
                          ),
                        ),

                        Column(
                          children: [

                            Container(
                              height:MediaQuery.of(context).size.height/8.5,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/servicedetail1.png')
                                  )
                              ),
                            ),
                             SizedBox(height: 8.5,),

                            Container(
                              height:MediaQuery.of(context).size.height/8.5,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/servicedetail2.png')
                                  )
                              ),
                            ),


                          ],
                        )

                      ],
                    ),
                  )







                ],
              ),
            )

          ],
        ),
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
