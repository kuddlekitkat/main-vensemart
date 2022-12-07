import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vensemart/products/screens/ProductsSuccessScreen.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({Key? key}) : super(key: key);


  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {


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
        actions: [
          Icon(Icons.more_horiz,color: Colors.grey,size: 30,)
        ],
        automaticallyImplyLeading: false,
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Column(
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('Address Details'),
                           TextButton(
                             onPressed: (){

                             },
                             child: Text('CHANGE',style: TextStyle(color: Color(0xff1456f1))),),
                         ],
                       ),

                     Container(
                       height: screenHeight / 6.2,
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
                             Text('Aaron Dikko' ,style: TextStyle(fontSize: 10)),
                             Text('Gambiya Street Area 11',style: TextStyle(fontSize: 10)),
                             Text('Federal Capital Territory',style: TextStyle(fontSize: 10)),
                             Text('ABUJA GARKI',style: TextStyle(fontSize: 10)),
                             Text('+2348101013370',style: TextStyle(fontSize: 10)),
                           ],
                         ),
                       )
                     ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pick a payment method'),
              ],
            ),
          ),

                      Container(
                          height: screenHeight /12,
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
                                Text('Make a payment'),
                              ],
                            ),
                          )
                      ),


                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Product Ordered'),
                          ],
                        ),
                      ),

                      Container(
                          height: screenHeight / 4,
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
                                Text('PRODUCT 1 of 1' ,style: TextStyle(fontSize: 13),),
                                Text('Haircut',style: TextStyle(fontSize: 10)),
                                Text('PRODUCT to be rendered by: Amarachi',style: TextStyle(fontSize: 10)),
                                Text('Delivery Date : 20th September 2022',style: TextStyle(fontSize: 10)),
                                SizedBox(height: 20.0,),

                                Text('PRODUCT 1 of 1' ,style: TextStyle(fontSize: 13),),
                                Text('Haircut'),
                                Text('PRODUCT to be rendered by: Amarachi',style: TextStyle(fontSize: 10)),
                                Text('Delivery Date : 20th September 2022',style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sub total Price',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0),),
                                Text('956,300',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery fee',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0)),
                                Text('N500',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Voucher',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0)),
                                Text('0.00',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total price',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0)),
                                Text('956,800',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                              ],
                            ),
                        SizedBox(height: 20.0,),

                        Container(
                          height: screenHeight/13,
                          width: screenWidth/1.02,
                          decoration: BoxDecoration(
                            color: Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(40.0),

                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => ProductsSuccessScreen(),
                                ),
                              );
                            },
                            child: Center(child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => ProductsSuccessScreen(),
                                    ),
                                  );
                                },child: Text('Pay Now',style: TextStyle(color: Colors.white),)),
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
