import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vensemart/models/upcoming_bookings.dart';

class AppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String occupation;
  final Data? upcomingBooking;
  const AppointmentCard( {required this.image,required this.name,required this.occupation,  this.upcomingBooking});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height:50,
                    width: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),

                    ),

                   child:  CachedNetworkImage(
                      imageUrl: upcomingBooking?.profile,
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
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      child: Text(upcomingBooking?.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    Text(upcomingBooking?.categoryName),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width/3.6,
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 12.0),
                  child: upcomingBooking?.status == 2 ? Container(
                    width: MediaQuery.of(context).size.width/4.1,
                    height: MediaQuery.of(context).size.width/9.5,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: TextButton(
                      onPressed: (){}, child: Flexible( child: Text('Booked',style: TextStyle(color: Colors.white, fontSize: 10),)),),
                  ) : Container(
                    width: MediaQuery.of(context).size.width/4.2,
                    height: MediaQuery.of(context).size.width/9.5,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: TextButton(
                      onPressed: (){}, child: Flexible( child: Text('Pending',style: TextStyle(color: Colors.white,fontSize: 10),)),),
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/4.0,
                        height: MediaQuery.of(context).size.width/9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Flexible(child: Text(upcomingBooking?.bookingDate,style: TextStyle(color: Colors.white, fontSize: 10),)),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.width/9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Flexible(child: Text(upcomingBooking?.bookingTime,style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,fontSize: 12),)),),
                      ),
                    ),
                  ],
                )

              ],
            )


          ],


        ),
      ),
    );
  }
}
