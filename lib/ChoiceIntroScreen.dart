import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import 'ProductsComingSoon.dart';

class ChoiceIntroScreen extends StatelessWidget {
  const ChoiceIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('Choose your shopping style',style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none),),
          SizedBox(height: 10.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.blueAccent),
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => ProductComingSoonScreen(),
                      ),
                    );
                  },
                  child: Image.asset('assets/images/choicesproduct2.png')
                ),
              ),
              SizedBox(width: 12.0,),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => ServicesHomeScreen(),
                      ),
                    );
                  },
                  child: Image.asset('assets/images/ChoicesService.png')
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
