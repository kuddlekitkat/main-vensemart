import 'package:flutter/material.dart';
import 'package:vensemart/services/widgets/components/CompletedAppointmentCard.dart';

class CompletedAppointmentList extends StatelessWidget {
  const CompletedAppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompletedAppointmentCard(image: 'assets/images/upcoming1.png',name: 'Amarachi', occupation: 'barber',),
        CompletedAppointmentCard(image: 'assets/images/upcoming3.png',name: 'Maduabuchi', occupation: 'Laundry',),
        CompletedAppointmentCard(image: 'assets/images/upcoming2.png',name: 'Prosper', occupation: 'Janitor',),
        CompletedAppointmentCard(image: 'assets/images/upcoming4.png',name: 'Amarachi', occupation: 'Solar Installer',),


      ],
    );
  }
}
