import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/core/app_export.dart';

import '../../../products/screens/CategoryScreen.dart';
import '../../../services/provider/provider_services.dart';
import '../../../widgets/custom_image_view1.dart';

// ignore: must_be_immutable
class GridelectronicsItemWidget extends StatefulWidget {
  final String categoryName;
  final String imageName;
  final String id;
  GridelectronicsItemWidget({required this.categoryName, required this.imageName,required this.id});

  @override
  State<GridelectronicsItemWidget> createState() => _GridelectronicsItemWidgetState();
}

class _GridelectronicsItemWidgetState extends State<GridelectronicsItemWidget> {
  ProviderServices? _providerServices;
  @override
  void initState() {
    // TODO: implement initState
    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : () {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryScreen(categoryId: widget.id.toString(),)));
      },
      child: Container(
        padding: getPadding(
          left: 20,
          top: 10,
          right: 20,
          bottom: 10,
        ),
        decoration: AppDecoration.fillBlue50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView1(
              imagePath: '${widget.imageName}',
              height: getVerticalSize(
                44.00,
              ),
              width: getHorizontalSize(
                59.00,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 5,
              ),
              child: Text(
                widget.categoryName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRubikRomanMedium90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
