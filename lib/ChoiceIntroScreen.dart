import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import 'ProductsComingSoon.dart';
import 'firebase_service.dart/firebase_service.dart';

class ChoiceIntroScreen extends StatefulWidget {
  const ChoiceIntroScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceIntroScreen> createState() => _ChoiceIntroScreenState();
}

class _ChoiceIntroScreenState extends State<ChoiceIntroScreen> {


  TextEditingController addressController = TextEditingController();
  ProviderServices? providerServices;

  @override
  void initState() {
    firebaseService.firebasePushNotification(context);
    super.initState();


  }







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

                    Navigator.pushAndRemoveUntil(
                        context!,
                        MaterialPageRoute(
                            builder: (context) => ServicesHomeScreen(), maintainState: true),
                            (Route<dynamic> route) => false);
                    
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
