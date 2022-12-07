import 'package:flutter/material.dart';

class ProductsOfferAppBar extends StatelessWidget {
  const ProductsOfferAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu),color: Colors.black,),
        title: Center(child: const Text('ProductOffers',style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
        elevation: 0.00,
        actions: [

          IconButton(onPressed: (){
            // Navigator.push(
            //   context,
            //   new MaterialPageRoute(
            //     builder: (context) => ProductsHome(),
            //   ),
            // );
          }, icon: Icon(Icons.search,color: Colors.black,),),


          Icon(Icons.doorbell,color: Colors.black,),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}
