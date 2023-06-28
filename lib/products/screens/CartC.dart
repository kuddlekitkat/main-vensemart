import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/models/cart_model.dart';

import '../../services/provider/provider_services.dart';

class CardC extends StatefulWidget {
  final id;
  final String image;
  final String name;
  final quantity;
  final amount;
  final CartList cardList;
  const CardC(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      this.quantity,
      required this.amount,
      required this.cardList})
      : super(key: key);

  @override
  State<CardC> createState() => _CardCState();
}

class _CardCState extends State<CardC> {
  ProviderServices? _providerServices;

  @override
  void initState() {
    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.cartlist();

    super.initState();
  }

  void _addQuantity(context) async {
    setState(() {});
    print('addition working ${widget.id}');
    _providerServices?.addQuantity(map: {
      "product_id": widget.id.toString(),
    }, context: context);
    setState(() {});

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: AutoSizeText('Increasing item quantity..please wait'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));

    _providerServices?.cartlist();
    // _providerServices?.addQuantity(map: {
    //   "product_id": widget.id,
    // }, context: context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CartScreen(),
    //   ),
    // );
  }

  void _removeProduct(context) async {
    setState(() {});
    print('addition working ${widget.id}');
    _providerServices?.removeProductToCart(map: {
      "product_id": widget.id.toString(),
    }, context: context);
    setState(() {});
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: AutoSizeText('Removing Product,please wait'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));

    _providerServices?.cartlist();
    // _providerServices?.addQuantity(map: {
    //   "product_id": widget.id,
    // }, context: context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CartScreen(),
    //   ),
    // );
  }

  void _reduceQuantity(context) async {
    setState(() {});
    _providerServices?.reduceQuantity(map: {
      "product_id": widget.id.toString(),
    });
    setState(() {});
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: AutoSizeText('reducing item quantity..please wait'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
    _providerServices?.cartlist();
    //
    // print('reduction working');
    // _providerServices?.reduceQuantity(map: {
    //   "product_id" : widget.id.toString(),
    //
    // }, context: context);
  }

  void printSomething(String id, context) async {
    print('added ${widget.id}');

    _providerServices?.addProductToCart(map: {
      "product_id": widget.id.toString(),
      "cat_id": 1.toString(),
      "qty": 1.toString(),
      "uom_id": 3.toString(),
      "net_amount": 100.toString(),
      "discount": 1.toString()
    }, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image: NetworkImage('${widget.image}'), fit: BoxFit.cover),
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
                              1.0 * MediaQuery.of(context).size.height * 0.01,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Seller : kings iphone",
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                      Text(
                        "Location: ${widget.id} ",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "NGN ${widget.amount}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 11.0),
                      child: InkWell(
                        onTap: () => _removeProduct(context),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          height: MediaQuery.of(context).size.height / 24,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                  size: 19,
                                ),
                                Text(
                                  "Remove",
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
                    ),
                    Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xff494E6E)),
                          child: InkWell(
                            onTap: () => _addQuantity(context),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${widget.quantity}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () => _reduceQuantity(context),
                          child: Container(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            height: 28,
                            width: 28.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xff494E6E)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
