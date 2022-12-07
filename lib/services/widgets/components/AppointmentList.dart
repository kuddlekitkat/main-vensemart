import 'package:flutter/material.dart';
import 'package:vensemart/services/widgets/components/AppointmentCard.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppointmentCard(image: 'assets/images/upcoming1.png', name: 'Amarachi', occupation: 'Haircut'),
        AppointmentCard(image: 'assets/images/upcoming2.png', name: 'Maduabuchi', occupation: 'Janitor'),
        AppointmentCard(image: 'assets/images/upcoming3.png', name: 'Amarachi', occupation: 'Laundry'),
       

      ],
    );
  }
}
