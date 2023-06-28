import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vensemart/ChoiceIntroScreen.dart';
import 'package:vensemart/services/screens/ConfirmAddressScreen.dart';

import '../../LoginScreen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Add your custom logic here
        Navigator.pop(
            context); // This line allows the back button to work as expected
        return false; // This line prevents the default behavior of the back button
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: const Color(0xff1456f1),
        //   leading: IconButton(
        //     icon: CircleAvatar(
        //       radius: 20,
        //       backgroundColor: Colors.white,
        //       child: Center(
        //         child: IconButton(
        //           icon: const Icon(
        //             Icons.arrow_back_ios,
        //             color: Colors.black,
        //           ),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //         ),
        //       ),
        //     ),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 40,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/howwork.png'),
                        fit: BoxFit.cover)),
              ),

              Positioned(
                top: 670,
                left: 300,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ConfirmAddressScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                       Icon(Icons.forward,color: Colors.blue,),
                       Text(
                        'Skip',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color(0xff1456f1)),
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
