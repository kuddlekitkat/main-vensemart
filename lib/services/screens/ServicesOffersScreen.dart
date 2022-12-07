import 'package:flutter/material.dart';
import 'package:vensemart/services/widgets/components/NotificationCard.dart';

class ServicesOffersScreen extends StatefulWidget {
  const ServicesOffersScreen({Key? key}) : super(key: key);

  @override
  State<ServicesOffersScreen> createState() => _ServicesOffersScreenState();
}

class _ServicesOffersScreenState extends State<ServicesOffersScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(234,234,234,3),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              NotificationCard(),
              SizedBox(height: 12.0),
              NotificationCard(),
            ],
          ),
        ),
      ),
    );
  }
}
