import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vensemart/products/screens/CartScreen.dart';
import 'package:vensemart/products/screens/DeliveryDetailsScreen.dart';

import '../widgets/components/TopSellingImage.dart';


class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: double.infinity,
                  decoration:  BoxDecoration(

                    image: const DecorationImage(
                        image: AssetImage('assets/images/shopdt.png'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.heart,
                                color: Colors.black,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.cart_badge_plus,
                                color: Colors.black,
                              ),
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),

              ],

            ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [

                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 30,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                              image: DecorationImage(

                                  image: AssetImage('assets/images/servicescheckmark.png')
                              )
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text('King\'s phones',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width/5,),

                    Container(
                      height: MediaQuery.of(context).size.height/16,
                      width: MediaQuery.of(context).size.width/2.8,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(234 ,234, 234, 30),
                          borderRadius: BorderRadius.circular(40.0)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star,color: Color(0xffFFD700)),
                          Text('4.5(4.5 Reviews)')
                        ],
                      ),
                    ),

                  ],
                ),



                SizedBox(height: 12.0,),
                Text('Best Mobile is a world class mobile gadget and devices sales and services retails stores'
                    'and one stop shop for everything mobile! we offer the latest and ...'),


                SizedBox(height: 12.0,),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_on),

                    Text('Abuja, Garki 11',style: TextStyle(fontWeight: FontWeight.bold),)


                  ],
                ),
                SizedBox(height: 12.0,),
                Row(
                  children: [

                    SizedBox(width: 12.0,),
                    Text('Similar products from king\'s phones'),
                  ],
                ),

                SizedBox(height: 12.0,),

                SizedBox(height: 12.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TopSellingImage(image: 'assets/images/productdbelow1.png', name: 'Samsung galax..', price: 'N554,000'),
                    TopSellingImage(image: 'assets/images/productdbelow2.png', name: 'Redmi Activ', price: 'N120,000'),
                    TopSellingImage(image: 'assets/images/productdbelow3.png', name: 'itel A58', price: 'N800,000'),

                  ],

                ),
                SizedBox(width: 10,),

                SizedBox(height: 12.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TopSellingImage(image: 'assets/images/productdbelow1.png', name: 'Samsung s3.', price: 'N203,000'),
                    TopSellingImage(image: 'assets/images/productdbelow2.png', name: 'iPhone 11', price: 'N299,340'),
                    TopSellingImage(image: 'assets/images/productdbelow3.png', name: 'Tecno Phantom', price: 'N138,850'),

                  ],

                ),







              ],
            ),
          )

          ],
        ),
      ),
    );
  }
}
