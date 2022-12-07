

import 'package:flutter/material.dart';

import '../full_pages/ProductsHome.dart';

class ProductsCartAppBar extends StatelessWidget {
  const ProductsCartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu),color: Colors.black,),
        title: Center(child: const Text('Cart',style: TextStyle(color: Colors.black),)),
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,
        actions: [

          IconButton(onPressed: (){
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => ProductsHome(),
              ),
            );
          }, icon: Icon(Icons.search,color: Colors.black,),),


          Icon(Icons.doorbell,color: Colors.black,),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}
