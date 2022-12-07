import 'package:flutter/material.dart';

import 'OrderListCard.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        OrderListCard(image: 'assets/images/topselling1.png'),
        OrderListCard(image: 'assets/images/topselling1.png'),

      ],
    );
  }
}
