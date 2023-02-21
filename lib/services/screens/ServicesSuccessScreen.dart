import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vensemart/services/provider/rating_service.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

class ServicesSuccessScreen extends StatelessWidget {
  const ServicesSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                      image:
                          const AssetImage('assets/images/successcheck.png'))),
            ),

            // FaIcon(Icons.check_circle,color: Colors.blueAccent,size: 100,),
            SizedBox(
              height: 50.0,
            ),
            Container(
                width: 320,
                child: Column(
                  children: [
                    Text(
                      'Booking Completed',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                )),
            SizedBox(
              height: 15.0,
            ),

            Container(
                width: 320,
                child: Column(
                  children: [
                    Text(
                      'The details of your appointment have been sent to',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'your email',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                )),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: screenHeight / 16,
              width: screenWidth / 2.50,
              decoration: BoxDecoration(
                color: Color(0xff1456F1),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicesHomeScreen(),
                    ),
                  );
                  RatingService ratingService = RatingService();
                  await ratingService.isSecondTimeOpen();
                },
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
