import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/DeliveryDetailsScreen.dart';
import 'package:vensemart/products/widgets/components/CartCard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 4),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 248, 254, 5),
        elevation: 0.00,
        title:
            Center(child: Text('Cart', style: TextStyle(color: Colors.black))),
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
            Column(
              children: [
                const CartCard(
                  image: 'assets/images/topselling3.png',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const CartCard(
                  image: 'assets/images/topselling3.png',
                ),
                SizedBox(
                  height: 8.0,
                ),
                CartCard(
                  image: 'assets/images/topselling3.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub total Price',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20.0),
                          ),
                          Text('956,300',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Delivery fee',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0)),
                          const Text('N500',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Voucher',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0)),
                          const Text('0.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total price',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0)),
                          Text('956,800',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
