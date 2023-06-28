import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/DeliveryDetailsScreen.dart';
import 'package:vensemart/products/screens/ProdC.dart';
import 'package:vensemart/products/widgets/components/CartCard.dart';
import 'package:vensemart/services/provider/provider_services.dart';

import '../../services/provider/provider_services.dart';
import 'CartC.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.cartlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(builder: (_, provider, __) {
      if (provider.cartModel?.message == null) {
        return SpinKitCircle(
          color: Colors.blue[900],
        );
      } else {
        return Scaffold(
          backgroundColor: Color.fromRGBO(234, 234, 234, 4),
          // appBar: AppBar(
          //   backgroundColor: Color.fromRGBO(247, 248, 254, 5),
          //   elevation: 0.00,
          //   title: Center(
          //       child: AutoSizeText(
          //           'Cart', style: TextStyle(color: Colors.black))),
          //   leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.white,
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.arrow_back_ios,
          //           color: Colors.grey,
          //         ),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   ),
          //   actions: [
          //     Icon(
          //       Icons.more_horiz,
          //       color: Colors.grey,
          //       size: 30,
          //     )
          //   ],
          //   automaticallyImplyLeading: false,
          // ),
          body: SingleChildScrollView(
            child: provider.cartModel?.message == "Cart is Empty" ?
            Center(child: Text('Cart is empty'),) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<ProviderServices>(
                  builder: (_, provider, __) {
                    print('object ${provider.cartModel?.data}');
                    if (provider.cartModel?.data == null) {
                      return Center(
                          child: SpinKitCircle(
                            color: Colors.blue,
                          ));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ...provider.cartModel!.data!.cartList!.map((e) {
                              print('print e for me $e');
                              return CardC(
                                cardList: e,
                                name: e.productName.toString(),
                                id: e.productId,
                                image: '${e.productImage}',
                                quantity: e.quantity,
                                amount: e.netAmount,
                              );
                            }).toList()
                            // ...?provider.serviceProviderPlans?.data!
                            //     .map((e) => SubscriptionCard(
                            //           servicesProviderPlans: e,
                            //         ))
                            //     .toList()

                            // SizedBox(height: 10,),
                            //   SubscriptionCard(),
                            // SizedBox(height: 10,),
                            // SubscriptionCard(),
                            // SizedBox(height: 10,),
                            // SubscriptionCard(),
                            // SizedBox(height: 10,),
                            // SubscriptionCard(),
                          ],
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryDetailsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 13,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Color(0xff1456f1)),
                    child: const Center(
                      child: Text(
                        'Order now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
