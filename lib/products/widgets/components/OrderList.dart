import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider_services.dart';
import 'OrderListCard.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
    providerServices?.getAllOrders();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<ProviderServices>(
        builder: (_, provider, __) {
      print('object ${provider.orderModel?.data}');
      if (provider.orderModel?.message == null) {
        return Center(child: SpinKitCircle(color: Colors.blue,),
        );
      } else {
    return provider.orderModel?.data == null ? Center(child : Text('No Orders found')) : Column(
      children:  [
        ...provider.orderModel!.data!.map((e) {
          print('print e for me $e');
          return Column(
            children: [
              ...e.productList!.map((e) {
                print('print e for me ${e.imageName}');
                return OrderListCard(image: '${e.imageName}',name: '${e.productName}',
                  vendorName: '${e.storeName}', netAmount: '${e.netAmount}', quantity: '${e.quantity ?? '1'}',);
              }).toList()
            ],
          );
        }).toList()
        // OrderListCard(image: 'assets/images/topselling1.png'),
        // OrderListCard(image: 'assets/images/topselling1.png'),

      ],
    );
      }
        });
     }

}
