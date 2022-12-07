import 'package:flutter/material.dart';

class StaggeredImage extends StatelessWidget {
  final String image;
  const StaggeredImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
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



      ],
    );
  }
}
