import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../provider/provider_services.dart';

class CancelRequestScreen extends StatefulWidget {

  final String bookingId;
  const CancelRequestScreen({Key? key,required this.bookingId}) : super(key: key);

  @override
  State<CancelRequestScreen> createState() => _CancelRequestScreenState();
}

class _CancelRequestScreenState extends State<CancelRequestScreen> {


  ProviderServices? providerServices;
  var rating;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }


  void rejectBooking(context) async {
    if (true) {
     providerServices?.acceptRejectBooking(map: {
        "booking_id": widget.bookingId.toString(),
        "status": 5.toString()
      }, context: context);
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  void dispose() {
    // Use _ancestorWidget reference here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Add your custom logic here
        Navigator.pop(
            context); // This line allows the back button to work as expected
        return false; // This line prevents the default behavior of the back button
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
        appBar: AppBar(
          elevation: 0.00,
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Cancel Booking"),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),

        body: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Center(
                child: AutoSizeText(
                  'Are you sure you would like to cancel this service?',
                  style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 25),
            // RatingBar.builder(
            //   initialRating: 3,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => const Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   onRatingUpdate: (rating) {
            //     rating = rating;
            //     print(rating);
            //   },
            // ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap: () =>  Navigator.pop(context),
                  child: Consumer<ProviderServices>(
                    builder: (_, value, __) => Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 2.60,
                        decoration: BoxDecoration(
                          color:  Colors.green,
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        child: value.isLoading == true
                            ? const SpinKitCircle(
                          color: Colors.white,
                        )
                            : const Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width:
                  8,),
                GestureDetector(
                  onTap: () => rejectBooking(context),
                  child: Consumer<ProviderServices>(
                    builder: (_, value, __) => Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 2.6,
                        decoration: BoxDecoration(
                          color:  Colors.red,
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        child: value.isLoading == true
                            ? const SpinKitCircle(
                          color: Colors.white,
                        )
                            : const Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
