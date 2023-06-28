import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/DeliveryDetailsScreen.dart';
import 'package:vensemart/products/widgets/components/CartCard.dart';
import 'package:vensemart/services/provider/provider_services.dart';

import '../../services/provider/provider_services.dart';

class CarttestScreen extends StatefulWidget {
  CarttestScreen({Key? key}) : super(key: key);

  @override
  State<CarttestScreen> createState() => _CarttestScreenState();
}

class _CarttestScreenState extends State<CarttestScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.cartlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 4),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 248, 254, 5),
        elevation: 0.00,
        title: Center(
            child: AutoSizeText('Cart', style: TextStyle(color: Colors.black))),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 30,
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  return Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: ListView.builder(
                        itemCount: provider.cartModel!.data!.cartList!.length,
                        itemBuilder: ((context, index) {
                          return CartCard(
                            id: provider.cartModel?.data?.cartList?[index].id,
                            image:
                                '${provider.cartModel?.data?.cartList?[index].productImage}',
                            name:
                                '${provider.cartModel?.data?.cartList?[index].productName}',
                            amount:
                                '${provider.cartModel?.data?.cartList?[index].netAmount}',
                            quantity:
                                '${provider.cartModel?.data?.cartList?[index].quantity}',
                          );
                        })),
                  );
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 3,
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
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 1.5,
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
}
