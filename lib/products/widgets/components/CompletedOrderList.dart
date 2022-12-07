import 'package:flutter/material.dart';
import 'package:vensemart/products/widgets/components/CompletedOrderListCard.dart';
import 'package:vensemart/services/widgets/components/CompletedAppointmentCard.dart';

class CompletedOrderList extends StatelessWidget {
  const CompletedOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompletedOrderListCard(image : 'assets/images/activeOrderlist4.png'),
        CompletedOrderListCard(image : 'assets/images/activeOrderlist3.png'),
        // CompletedOrderListCard(image : 'assets/images/topselling2.png'),

      ],
    );
  }
}
