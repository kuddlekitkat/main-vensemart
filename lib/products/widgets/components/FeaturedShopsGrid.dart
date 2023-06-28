import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'TopSellingImage.dart';

class FeaturedShopGrid extends StatelessWidget {
  const FeaturedShopGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, index) => const AutoSizeText('hello'),
        itemCount: 6,
      ),
    );
  }
}
