import 'package:flutter/material.dart';

import 'TopSellingImage.dart';

class TopSellingGrid extends StatelessWidget {


  final List<Widget> cardsList = const [

    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
    TopSellingImage(image: 'assets/images/user2.jpg', name: 'iphone 13', price: '14'),
  ];

  const TopSellingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1,
      child: GridView.builder(
          physics: ScrollPhysics(),
          itemCount: cardsList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          //crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return Container(child: cardsList[index]);
          }),
    );
  }
}
