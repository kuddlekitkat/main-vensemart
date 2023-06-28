import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import '../../models/login_model.dart' as login;
import '../../models/user_details.dart' as userdetail;
import '../../models/cart_model.dart';
import '../../services/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SubscriptionCard extends StatefulWidget {
  SubscriptionCard(
      {Key? key,
      required this.cartlist,
      this.loginModel,
      this.userDetailsModel})
      : super(key: key);
  CartList cartlist;
  login.LoginModel? loginModel;
  userdetail.UserDetailsModel? userDetailsModel;

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  final payStackClient = PaystackPlugin();
  ProviderServices? providerServices;

  void _startPaystack() async {
    await dotenv.load(fileName: '.env');
    String? publicKey = dotenv.env['PUBLIC_KEY'];
    payStackClient.initialize(publicKey: publicKey!);
  }

  final snackBarSuccess = const SnackBar(
    content: AutoSizeText('Payment Successful, Thanks for your patronage !'),
  );

  final snackBarFailure = const SnackBar(
    content: AutoSizeText('Payment Unsuccessful, Please Try Again.'),
  );

  final String reference =
      "unique_transaction_ref_${Random().nextInt(1000000000)}";

  void _makePayment(int amount) async {
    final Charge charge = Charge()
      ..amount = amount * 100
      ..email = widget.userDetailsModel?.data?.email
      ..reference = reference;

    final CheckoutResponse response = await payStackClient.checkout(context,
        charge: charge, method: CheckoutMethod.card);

    print('object....${response.toString}');

    if (response.status && response.reference == reference) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
      print('object....$response');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
    }
  }

  void reduceQuantity(id) async {
    setState(() {});
    providerServices?.reduceQuantity(map: {
      "product_id": widget.cartlist.productId,
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CartScreen(),
    //   ),
    // );
  }

  void addToCart(context) async {
    setState(() {});
    providerServices?.addProductToCart(map: {
      "product_id": widget.cartlist.productId,
      "cat_id": 1.toString(),
      "qty": 1.toString(),
      "uom_id": 3.toString(),
      "net_amount": 100.toString(),
      "discount": 1.toString()
    }, context: context);
  }

  @override
  void initState() {
    super.initState();
    _startPaystack();
  }

  @override
  Widget build(BuildContext context) {
    print('set me up ${widget.cartlist}');
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () =>
          // _makePayment(int.parse(widget.cartlist.netAmount.toString())),
          addToCart(context),
      child: Container(
        height: screenheight / 4.7,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.only(top: screenheight / 15, left: screenwidth / 8),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.cartlist.productName ?? ''),
                Container(
                  height: screenheight / 10,
                  width: screenwidth / 2,
                  child: Text(
                    widget.cartlist?.productDescription ?? '',
                    style: TextStyle(fontSize: screenwidth / 38),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bed),
                Container(
                  height: screenheight / 10,
                  width: screenwidth / 4,
                  child: Text(
                    '${widget.cartlist?.netAmount}' ?? '',
                    style: TextStyle(fontSize: screenwidth / 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
