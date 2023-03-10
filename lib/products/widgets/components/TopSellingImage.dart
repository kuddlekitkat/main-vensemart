import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/ProductDetailScreen.dart';
import 'package:vensemart/products/screens/ShopDetailScreen.dart';

class TopSellingImage extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const TopSellingImage({required this.image,required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ProductDetailScreen(id: 3.toString()),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            height: MediaQuery.of(context).size.height /6,
            width: MediaQuery.of(context).size.width /4,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
            ),

          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Text(name,style: TextStyle(fontSize: 13),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(price,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
