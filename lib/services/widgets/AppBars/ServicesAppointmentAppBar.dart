import 'package:flutter/material.dart';

class ServicesAppointmentAppBar extends StatelessWidget {
  const ServicesAppointmentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1456f1),
      child: WillPopScope(
        onWillPop: () async {
          // Add your custom logic here
          Navigator.pop(
              context); // This line allows the back button to work as expected
          return false; // This line prevents the default behavior of the back button
        },
        child: Text(
          '.',
          style: TextStyle(backgroundColor: Colors.blue),
        ),
        // child: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Color(0xff1456f1),
        //     title:  Text("Request Screen"),
        //     leading: IconButton(onPressed: (){
        //       Scaffold.of(context).openDrawer();
        //     }, icon: Icon(Icons.sort),color: Colors.black,),
        //   ),
        // ),
      ),
    );
  }
}
