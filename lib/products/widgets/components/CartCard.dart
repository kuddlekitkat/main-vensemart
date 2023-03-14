import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_model.dart';
import '../../../services/provider/provider_services.dart';
import '../../screens/CartScreen.dart';

class CartCard extends StatefulWidget {
  final id;
  final String image;
  final String name;
  final quantity;
  final amount;

  CartCard(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.amount})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  ProviderServices? _providerServices;

  @override
  void initState() {
    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.cartlist();
    super.initState();
  }

  void addToCart(context) async {
    setState(() {});
    _providerServices?.addProductToCart(map: {
      "product_id": 296.toString(),
      "cat_id": 1.toString(),
      "qty": 1.toString(),
      "uom_id": 3.toString(),
      "net_amount": 100.toString(),
      "discount": 1.toString()
    }, context: context);
  }

  void _addQuantity(context) async {
    print('addition working ${widget.id}');
    _providerServices?.addQuantity(map: {
      "product_id": widget.id,
    }, context: context);

    _providerServices?.addQuantity(map: {
      "product_id": widget.id,
    }, context: context);
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
    //
    // print('reduction working');
    // _providerServices?.reduceQuantity(map: {
    //   "product_id" : widget.id.toString(),
    //
    // }, context: context);
  }

  void _removeCart(context) async {
    setState(() {});
    _providerServices?.removeProductToCart(map: {
      "product_id": widget.id.toString(),
    }, context: context);
    print('remove working');
    _providerServices?.removeProductToCart(map: {
      "product_id": widget.id.toString(),
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
                          fontSize: 18,
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
                        "${widget.amount}",
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
                        onTap: () => addToCart(context),
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
                          child: InkWell(
                            onTap: () => _addQuantity(context),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          height: 28,
                          width: 28.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xff494E6E)),
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
