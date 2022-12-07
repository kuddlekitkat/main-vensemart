import 'package:flutter/material.dart';

class CompletedOrderListCard extends StatelessWidget {
  final String image;
  const CompletedOrderListCard({required this.image}) ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width -5,
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
            SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height /8,
              width: MediaQuery.of(context).size.width - 290,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/7,
              width: 240,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("iPhone 11 pro",style: TextStyle(fontSize: 18,color: Colors.black,),),
                        Text("Seller : kings iphone",style: TextStyle(fontSize: 11,color: Colors.black),),
                        Text("Location: Abuja ",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("2000 ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/4.5,
                          height: MediaQuery.of(context).size.height/24,
                          decoration: BoxDecoration(
                            color: Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(50.0),
                          ),

                          child: Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Icon(Icons.delete_forever,color: Colors.white,size: 19,),
                              Text("Completed",style: TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.bold,),),
                            ],
                          ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
