import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../provider/provider_services.dart';

class FeedBackScreen extends StatefulWidget {
  final String bookingId;

  FeedBackScreen({required this.bookingId});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  ProviderServices? providerServices;
  var rating;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void rateCustomer(context) async {
    if (true) {
      providerServices?.rateCustomer(map: {
        "booking_id": widget.bookingId.toString(),
        "rating": rating.toString()
      }, context: context);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FeedBackScreen(bookingId: widget.bookingId.toString())),
      );
    }
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
        body: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AutoSizeText(
              'Rate your experience',
              style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rating = rating;
                print(rating);
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 17,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          decoration: TextDecoration.none),
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
