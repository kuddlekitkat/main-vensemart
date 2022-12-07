import 'package:flutter/material.dart';

class ExploreServicesImage extends StatelessWidget {
  final String image;
  final String name;
  const ExploreServicesImage({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/bookings');
      },
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage(
                      image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(12.0)
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
