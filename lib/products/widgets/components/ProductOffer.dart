import 'package:flutter/material.dart';

class ProductOffer extends StatelessWidget {
  const ProductOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0.1),
            blurRadius: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight / 8,
            width: screenWidth / 4,
            margin: const EdgeInsets.only(right: 14),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
            child: const Center(
              child: Text(
                '14',
                style: TextStyle(fontSize: 29, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4.0),
              height: screenHeight / 8,
              width: screenHeight / 3.5,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Center(
                  child: Text(
                "Get 10% discount for  exciting customers and many more discounts on the way",
                style: TextStyle(fontSize: 12, color: Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
