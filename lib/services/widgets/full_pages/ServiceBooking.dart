import 'package:flutter/material.dart';

class ServiceBooking extends StatefulWidget {
  const ServiceBooking({Key? key}) : super(key: key);

  @override
  State<ServiceBooking> createState() => _ServiceBookingState();
}

class _ServiceBookingState extends State<ServiceBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Center(child: Text('hello',style: TextStyle(color: Colors.black),)),
          leading: Icon(Icons.dangerous_outlined, color: Colors.black),
          actions: [
            Icon(Icons.ac_unit_outlined,
              color: Colors.black,
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0.00,
        ),
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                          children: [
                            Text('hello'),
                            Text('hello'),
                          ],
                        ),
                        SizedBox(width: 160,
                        ),
                        Icon(Icons.outbond_outlined)
                      ],
                    ),
                    SizedBox(height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                        ),

                        SizedBox(width: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),

                          ],
                        )

                      ],
                    )


                  ],


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                          children: [
                            Text('hello'),
                            Text('hello'),
                          ],
                        ),
                        SizedBox(width: 160,
                        ),
                        Icon(Icons.outbond_outlined)
                      ],
                    ),
                    SizedBox(height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                        ),

                        SizedBox(width: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),

                          ],
                        )

                      ],
                    )


                  ],


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                          children: [
                            Text('hello'),
                            Text('hello'),
                          ],
                        ),
                        SizedBox(width: 160,
                        ),
                        Icon(Icons.outbond_outlined)
                      ],
                    ),
                    SizedBox(height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                        ),

                        SizedBox(width: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                            ),

                          ],
                        )

                      ],
                    )


                  ],


                ),
              ),
            ),

          ],
        )
    );
  }
}
