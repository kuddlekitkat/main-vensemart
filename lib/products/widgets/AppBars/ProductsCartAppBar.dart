import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../full_pages/ProductsHome.dart';

class ProductsCartAppBar extends StatelessWidget {
  const ProductsCartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        title: Center(
            child: const AutoSizeText(
          'Cart',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ProductsHome(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.doorbell,
            color: Colors.black,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
