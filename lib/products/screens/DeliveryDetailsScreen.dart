import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/screens/AddDeliveryAddressScreen.dart';
import 'package:vensemart/products/screens/ProductsSuccessScreen.dart';

import '../../services/provider/provider_services.dart';
import '../../services/screens/SetAddressScreen.dart';
import '../../theme/app_style.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  ProviderServices? providerServices;
  final payStackClient = PaystackPlugin();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.userLocation();
    providerServices?.userDetails();
    providerServices?.cartlist();
    _startPaystack();
    // TODO: implement initState
    super.initState();
  }

  void addOrder(context) async {
    setState(() {});
    providerServices?.addOrder(
        map: {
          "payment_type": "card",
          "delivery_charge": 1500.toString()},
        context: context);

    // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    //   content: AutoSizeText('Adding Product..'),
    //   duration: const Duration(seconds: 10),
    //   action: SnackBarAction(
    //     label: 'ACTION',
    //     onPressed: () {},
    //   ),
    // ));

    // providerServices?.cartlist();
  }

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
      ..email = providerServices?.userDetailsModel?.data?.email
      ..reference = reference;

    final CheckoutResponse response = await payStackClient.checkout(context,
        charge: charge, method: CheckoutMethod.card);

    print('object....${response.toString}');

    if (response.status && response.reference == reference) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
      addOrder(context);
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => const ProductsSuccessScreen(),
        ),
      );
      print('object....$response');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 248, 254, 5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 248, 254, 5),
        elevation: 0.00,
        title: Center(
            child: AutoSizeText('Delivery details',
                style: TextStyle(color: Colors.black))),
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
        child: Consumer<ProviderServices>(builder: (_, provider, __) {
          print('object :  ${provider.cartModel!.data}');
          if (provider.cartModel!.data == 'null') {
            return const AutoSizeText('No completed Requests');
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText('Address Details'),
                        TextButton(
                          onPressed: () {
                            addAddress(context);
                          },
                          child: AutoSizeText('CHANGE',
                              style: TextStyle(color: Color(0xff1456f1))),
                        ),
                      ],
                    ),

                    Container(
                      height: screenHeight / 7,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0),
                          color: Colors.white),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: provider?.userLocationModel?.data?.location
                                      .toString() !=
                                  null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${provider?.userDetailsModel?.data?.name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${provider?.userLocationModel?.data?.location}'),
                                    Text(
                                        '${provider?.userDetailsModel?.data?.mobile}'),
                                  ],
                                )
                              : AutoSizeText('no address found')),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       AutoSizeText('Pick a payment method'),
                    //     ],
                    //   ),
                    // ),

                    // Container(
                    //     height: screenHeight /12,
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(23.0),
                    //         color: Colors.white
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(20.0),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           AutoSizeText('Make a payment'),
                    //         ],
                    //       ),
                    //     )
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText('Product Ordered'),
                        ],
                      ),
                    ),

                    Container(
                        height: screenHeight / 2.47,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23.0),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...provider.cartModel!.data!.cartList!.map((e) {
                                print('print e for me $e');

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'PRODUCTS',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    AutoSizeText('${e.productName}',
                                        style: TextStyle(fontSize: 15)),
                                    AutoSizeText(
                                        'Product sold  by: ${e.storeName}',
                                        style: TextStyle(fontSize: 15)),
                                    AutoSizeText('Quantity : ${e.quantity}',
                                        style: TextStyle(fontSize: 15)),

                                    AutoSizeText('Original Price : ${e.productPrice}',
                                        style: TextStyle(fontSize: 15)),

                                    AutoSizeText('Discount Price : ${e.discount}',
                                        style: AppStyle.txtPoppinsSemiBold177),


                                    // AutoSizeText('Unit Price : ${e.productPrice}',style: TextStyle(fontSize: 10)),

                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                );
                              }).toList()
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Sub total Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0),
                              ),
                              AutoSizeText('${providerServices?.cartModel?.data?.cartDetails?.subTotal}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Delivery fee',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0)),
                              AutoSizeText('N${providerServices?.cartModel?.data?.cartDetails?.deliveryCharge}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Voucher',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0)),
                              AutoSizeText('0.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Total price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0),
                              ),
                              AutoSizeText('N ${providerServices?.cartModel?.data?.cartDetails?.grandTotal}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 33),
                            child: Column(
                              children: [
                                Container(
                                  height: screenHeight / 13,
                                  width: screenWidth / 1.10,
                                  decoration: BoxDecoration(
                                    color: Color(0xff1456f1),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: provider?.userLocationModel?.data
                                              ?.location
                                              .toString() !=
                                          null
                                      ? GestureDetector(
                                          onTap: () => _makePayment(providerServices?.cartModel?.data?.cartDetails?.grandTotal),
                                          child: Consumer<ProviderServices>(
                                            builder: (_, provider, __) =>
                                                Container(
                                              height: screenHeight / 13,
                                              width: screenWidth / 1.07,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff1456f1),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: provider.isLoading == true
                                                  ? const SpinKitCircle(
                                                      color: Colors.white,
                                                    )
                                                  : const Center(
                                                      child: Text(
                                                      'Pay Now',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0),
                                                    )),
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () => addAddress(context),
                                          child: Consumer<ProviderServices>(
                                            builder: (_, provider, __) =>
                                                Container(
                                              height: screenHeight / 13,
                                              width: screenWidth / 1.07,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff1456f1),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: provider.isLoading == true
                                                  ? const SpinKitCircle(
                                                      color: Colors.white,
                                                    )
                                                  : const Center(
                                                      child: Text(
                                                      'Add Address',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0),
                                                    )),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  addAddress(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => AddDeliveryAddressScreen()),
    );
  }

  addBooking(BuildContext context) {}
}
