import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vensemart/models/canceled_bookings.dart';

class CancelledAppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String occupation;
  final Data? cancelledBooking;
  const CancelledAppointmentCard(
      {required this.image,
      required this.name,
      required this.occupation,
      this.cancelledBooking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cancelledBooking?.profile.toString() ?? '',
                      fit: BoxFit.cover,
                      placeholder: (
                        context,
                        url,
                      ) =>
                          Container(
                              margin: const EdgeInsets.all(10),
                              child: const SpinKitCircle(
                                color: Colors.grey,
                              )),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/worker-image.jpeg'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        cancelledBooking?.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              1.0 * MediaQuery.of(context).size.height * 0.01,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    Text(occupation),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.6,
                ),
                // TextButton(onPressed: (){
                //   Navigator.push(
                //     context!,
                //     MaterialPageRoute(
                //         builder: (context) =>  RateScreen(bookingId:'${completedBooking?.id}' )),
                //
                //   );
                //
                // },child: Icon(Icons.outbond_outlined,color:Colors.black),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.9,
                    height: MediaQuery.of(context).size.width / 10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 234, 234, 3),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          Text(
                            'cancelled',
                            style: TextStyle(color: Colors.black, fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.9,
                        height: MediaQuery.of(context).size.width / 9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            cancelledBooking?.bookingDate ?? 'Booking Date',
                            style: TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.9,
                        height: MediaQuery.of(context).size.width / 9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            cancelledBooking?.bookingTime ?? 'Booking Time',
                            style: const TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
