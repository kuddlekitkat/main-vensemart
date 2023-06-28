import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider_services.dart';

class OrderListCard extends StatefulWidget {
  final String image;
  final String name;
  final String vendorName;
  final String netAmount;
  final String quantity;
  const OrderListCard({required this.image,required this.name, required this.vendorName, required this.netAmount,required this.quantity});

  @override
  State<OrderListCard> createState() => _OrderListCardState();
}

ProviderServices? providerServices;
class _OrderListCardState extends State<OrderListCard> {

  @override
  void initState() {
    // TODO: implement initState
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.1),
              blurRadius: 1,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width - 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage('https://api.vensemart.com/storage/product_images/'+widget.image), fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: 240,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: TextStyle(
                            fontSize:
                                1.5 * MediaQuery.of(context).size.height * 0.01,
                            color: Colors.black,
                          ),
                        ),
                        // Text(
                        //   "Seller : ${widget.vendorName}",
                        //   style: TextStyle(fontSize: 11, color: Colors.black),
                        // ),
                        Text(
                          "Location: Abuja",
                          style: TextStyle( fontSize:
                          1.5 * MediaQuery.of(context).size.height * 0.01, color: Colors.black),
                        ),

                        Text(
                          "Quantity : ${widget.quantity}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              ),
                        ),
                        Text(
                          "NGN ${widget.netAmount}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          height: MediaQuery.of(context).size.height / 24,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                // Icon(Icons.delete_forever,color: Colors.white,size: 19,),
                                Text(
                                  "Track Order",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
