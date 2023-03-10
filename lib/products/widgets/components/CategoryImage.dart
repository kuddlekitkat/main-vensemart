import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/CategoryScreen.dart';

class CategoryImage extends StatefulWidget {
  final String image;
  final String name;
  final String id;
  const CategoryImage({required this.image,required this.name, required this.id}) ;

  @override
  State<CategoryImage> createState() => _CategoryImageState();
}

class _CategoryImageState extends State<CategoryImage> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(categoryId: widget.id.toString()),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            height: MediaQuery.of(context).size.height /6,
            width: MediaQuery.of(context).size.width /4,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image:  DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover
              ),
            ),

          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 40.0),
          //       child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          //     ),
          //     // Padding(
          //     //   padding: const EdgeInsets.only(right: 40.0),
          //     //   child: Text(name),
          //     // ),
          //   ],
          // ),


        ],
      ),
    );
  }
}
