import 'package:flutter/material.dart';
import 'package:vensemart/products/widgets/components/ProductOffer.dart';

class ProductsOffersScreen extends StatefulWidget {
  const ProductsOffersScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOffersScreen> createState() => _ProductsOffersScreenState();
}

class _ProductsOffersScreenState extends State<ProductsOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ProductOffer(),
              SizedBox(height: 12.0),
              ProductOffer(),
            ],
          ),
        ),
      ),
    );
  }
}
