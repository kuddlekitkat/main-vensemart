import 'package:flutter/material.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

class ServicesHomeAppBar extends StatelessWidget {
  const ServicesHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.sort),color: Colors.black,),
        title: Center(child: const Text('Home',style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
        elevation: 0.00,
        actions: [

         IconButton(onPressed: (){
           Navigator.push(
             context,
             new MaterialPageRoute(
               builder: (context) => AvailableServicesListScreen(lat: 8.toString(),long: 9.toString(),id: 385.toString(),)
             ),
           );
         }, icon: Icon(Icons.search,color: Colors.black,),),


          Icon(Icons.notifications,color: Colors.black,),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}
