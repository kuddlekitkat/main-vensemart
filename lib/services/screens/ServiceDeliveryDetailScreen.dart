import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/ServicesSuccessScreen.dart';

class ServiceDeliveryDetailScreen extends StatelessWidget {
  String service_name;
  ServiceDeliveryDetailScreen({required this.service_name});

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247,248,254,5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247,248,254,5),
        elevation: 0.00,

        title: Center(child: Text('Delivery details',style: TextStyle(color: Colors.black))),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:CircleAvatar(
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address Details'),
                      TextButton(
                        onPressed: (){

                        },
                          child: Text('CHANGE',style: TextStyle(color: Colors.blueAccent)),),
                    ],
                  ),
                ),

                Container(
                    height: screenHeight / 4.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Aaron Dikko'),
                          Text('Gambiya Street Area 11'),
                          Text('Federal Capital Territory'),
                          Text('ABUJA GARKI'),
                          Text('+2348101013370'),
                        ],
                      ),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Services Ordered'),
                    ],
                  ),
                ),





                Container(
                    height: screenHeight / 4.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SERVICE 1 of 1' ,style: TextStyle(fontSize: 16),),
                          Text(service_name.toString()),
                          Text('Service to be rendered by: Amarachi'),
                          Text('Delivery Date : 20th September 2022'),
                        ],
                      ),
                    )
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                  child: Column(
                    children: [


                      Container(
                        height: screenHeight/13,
                        width: screenWidth/1.10,
                        decoration: BoxDecoration(
                          color: Color(0xff1456f1),
                          borderRadius: BorderRadius.circular(40.0),

                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => ServicesSuccessScreen(),
                              ),
                            );
                          },
                          child: Center(child: Text('Order Now',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),

          ),
        ),
      ),
    );
  }
}
