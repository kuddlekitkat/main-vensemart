import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vensemart/models/completed_bookings.dart';
import 'package:vensemart/services/screens/RateScreen.dart';

import '../../../ChoiceIntroScreen.dart';
class CompletedAppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String occupation;
  final Data? completedBooking;
  const CompletedAppointmentCard({required this.image,required this.name, required this.occupation, this.completedBooking});

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
                    height:50,
                    width: 60,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),

                    ),
                    child: CachedNetworkImage(
                      imageUrl: completedBooking?.profile ?? '',
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      child: Text(completedBooking?.name ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    Text(occupation),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width/3.6,
                ),


                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),

                  onPressed: (){
                  Navigator.push(
                    context!,
                    MaterialPageRoute(
                      builder: (context) =>  RateScreen(bookingId:'${completedBooking?.id}' )),

                  );

                },child: Text('Rate Service',style: TextStyle(fontSize: 10.0,color: Colors.white),),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 234, 234, 3),
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: TextButton(
                      onPressed: (){}, child: Row(
                        children: [
                          Icon(Icons.check_circle,color: Colors.green,),
                          Text('completed',style: TextStyle(color: Colors.black,fontSize: 8),),
                        ],
                      ),),
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.8,
                        height: MediaQuery.of(context).size.width/9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Flexible(child: Text(completedBooking?.bookingDate ?? '',style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,fontSize: 10),)),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.8,
                        height: MediaQuery.of(context).size.width/9.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Flexible(child: Text(completedBooking?.bookingTime ?? '',style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,fontSize: 12),)),),
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
