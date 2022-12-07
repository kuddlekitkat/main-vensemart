import 'package:flutter/material.dart';

class TrendingServicesImage extends StatelessWidget {
  final String image;

  const TrendingServicesImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12.0)
      ),
    );
  }
}
