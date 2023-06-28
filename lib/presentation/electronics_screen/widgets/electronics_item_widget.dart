import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/core/app_export.dart';

import '../../../products/screens/ProductDetailScreen.dart';
import '../../../services/provider/provider_services.dart';
import '../../../widgets/custom_image_view_detail.dart';

// ignore: must_be_immutable
class ElectronicsItemWidget extends StatefulWidget {
  final String id;
  final String title;
  final String price;

  final String imageName;
  ElectronicsItemWidget({ required this.id, required this.imageName, required this.title, required this.price});

  @override
  State<ElectronicsItemWidget> createState() => _ElectronicsItemWidgetState();
}

class _ElectronicsItemWidgetState extends State<ElectronicsItemWidget> {
  ProviderServices? providerServices;

  @override
  void initState() {
    // TODO: implement initState
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.productId(widget.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(id: widget.id.toString(),),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageViewDetail(
            imagePath: widget.imageName,
            height: getSize(
              100.00,
            ),
            width: getSize(
              100.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                10.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 3,
            ),
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold10,
            ),
          ),
          Text(
            "₦ ${widget.price}",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsSemiBold10Black900,
          ),
        ],
      ),
    );
  }
}
