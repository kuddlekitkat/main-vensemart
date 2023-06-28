import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/widgets/components/RegisterButton.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductsSuccessScreen extends StatelessWidget {
  const ProductsSuccessScreen({Key? key}) : super(key: key);

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
                  color: Color(0xff1456f1),
                  image: DecorationImage(
                      image: AssetImage('assets/images/successcheck.png'))),
            ),

            // FaIcon(Icons.check_circle,color: Color(0xff1456f1),size: 100,),
            SizedBox(
              height: 50.0,
            ),
            Container(
                width: 320,
                child: Column(
                  children: [
                    AutoSizeText(
                      'Your Order has been placed',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    AutoSizeText(
                      'Successfully',
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
                    AutoSizeText(
                      'The order details  have been sent to',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    AutoSizeText(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsHomeScreen(),
                    ),
                  );
                },
                child: Center(
                  child: AutoSizeText(
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
