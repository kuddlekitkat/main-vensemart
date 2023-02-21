import 'package:flutter/material.dart';

class ServicesOffersAppBar extends StatelessWidget {
  const ServicesOffersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu_outlined,color: Colors.black,),
        title: Center(
            child: const Text(
          'Offers',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
        elevation: 0.00,
        actions: [
          // Icon(Icons.check,color: Colors.black,),
          // Icon(Icons.check,color: Colors.black,),
        ],
      ),
    );
  }
}
