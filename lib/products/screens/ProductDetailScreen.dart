import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../services/provider/provider_services.dart';
import '../widgets/components/TopSellingImage.dart';
import 'CartScreen.dart';
import 'DeliveryDetailsScreen.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.productId(3.toString());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            print('object ${provider.productIdModel?.data}');
            if (provider.productIdModel?.data == null) {
              return Center(child: const SpinKitCircle(color: Colors.blue,));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/2.3,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          image:  DecorationImage(
                              image: NetworkImage('${provider.productIdModel?.data?.productImage}' ?? ''),
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
                                  backgroundColor:Colors.white,
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [

                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => DeliveryDetailsScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/17,
                                width: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(
                                    color: Color(0xff494E6E),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(child: Text('King\'s phones',style: TextStyle(color: Colors.white),)),
                              ),
                            ),

                            SizedBox(width: MediaQuery.of(context).size.width/4.5,),


                          ],
                        ),
                        SizedBox(height: 12.0,),

                        Text('iPhone 14 Pro',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 12.0,),

                        Text('A magical new way to interact with the iPhone. A vital new safety feature designed to save lives.'
                            'An innovative 48MP camera for mind-blowing detail. All powered by the ultimate smartphone chip',
                          style: TextStyle(
                              letterSpacing: 1
                          ),),
                        SizedBox(height: 12.0,),

                        Row(
                          children: [
                            Text('Brand : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('Apple',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff1456f1)),),
                          ],
                        ),
                        SizedBox(height: 12.0,),

                        Text('N950,000',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 12.0,),

                        // SizedBox(height: 12.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Icon(Icons.location_on),
                            // SizedBox(width: 12.0,),
                            Text('Quantity',style: TextStyle(fontSize: 20.0),),

                            Row(
                              children: [

                                Container(

                                  child: Icon(Icons.remove,color: Colors.white,),
                                  height: 28,
                                  width: 28.0,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xff494E6E)
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text('1',style: TextStyle(fontWeight: FontWeight.bold),),

                                SizedBox(width: 10.0,),
                                Container(

                                  child: Icon(Icons.add,color: Colors.white,),
                                  height: 28,
                                  width: 28.0,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xff494E6E)
                                  ),
                                ),


                              ],
                            ),

                            SizedBox(width: 10.0,),


                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => CartScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/16.9,
                                    width: MediaQuery.of(context).size.width/2.6,
                                    decoration: BoxDecoration(
                                        color: Color(0xff494E6E),
                                        borderRadius: BorderRadius.circular(50.0)
                                    ),
                                    child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 10),)),
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 12.0,),
                        Row(
                          children: [

                            SizedBox(width: 12.0,),

                            Row(
                              children: [
                                Text('Similar products from',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
                                SizedBox(width: 4,),
                                Text('king\'s phones,',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold,color: Color(0xff1456f1)),),
                              ],
                            ),

                          ],
                        ),

                        SizedBox(height: 12.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TopSellingImage(image: 'assets/images/productdbelow1.png', name: 'Samsung galax..', price: 'N554,000'),
                            TopSellingImage(image: 'assets/images/productdbelow2.png', name: 'Redmi Activ', price: 'N120,000'),
                            TopSellingImage(image: 'assets/images/productdbelow3.png', name: 'itel A58', price: 'N800,000'),

                          ],

                        ),

                      ],
                    ),
                  )

                ],
              );
            }
          },
        ),
      ),
    );
  }
}


