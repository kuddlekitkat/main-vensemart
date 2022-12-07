import 'package:flutter/material.dart';


class AddBookingsScreen extends StatelessWidget {
  const AddBookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.green,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(topRight: Radius.circular(50.0),topLeft: Radius.circular(50.0),)
        ),
      ),
    );
  }
}
