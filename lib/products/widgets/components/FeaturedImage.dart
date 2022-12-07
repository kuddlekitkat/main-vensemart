import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/ShopDetailScreen.dart';

class FeaturedImage extends StatelessWidget {
  final String image;
  final String name;

  const FeaturedImage({required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ShopDetailScreen(),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(name,style: TextStyle(fontSize: 12),),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 40.0),
              //   child: Text(name),
              // ),
            ],
          ),


        ],
      ),
    );
  }
}
