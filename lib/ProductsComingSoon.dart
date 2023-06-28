import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductComingSoonScreen extends StatelessWidget {
  const ProductComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Add your custom logic here
        Navigator.pop(
            context); // This line allows the back button to work as expected
        return false; // This line prevents the default behavior of the back button
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Products Coming Soon"),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(child: AutoSizeText('Products Coming Soon')),
      ),
    );
  }
}
