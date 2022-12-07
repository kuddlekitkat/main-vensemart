import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/ServicesGridScreen.dart';
import 'package:vensemart/services/screens/TrendingServicesScreen.dart';
import 'package:vensemart/services/widgets/components/ExploreServicesList.dart';
import 'package:vensemart/services/widgets/Drawers/ServicesDrawer.dart';
import 'package:vensemart/services/widgets/components/TrendingServicesList.dart';

import '../../screens/AvailableServicesListScreen.dart';

class ServiceHome extends StatefulWidget {
  const ServiceHome({Key? key}) : super(key: key);



  @override
  State<ServiceHome> createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  static const routeName = '/services-home';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                        child: Text('Hi james' , style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600),)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('what service do',
                          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('you need today',
                          style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        child: const Center(
                            child: Text('get started')),
                      ),
                    )
                  ],
                ),

                Container(
                  height: MediaQuery.of(context).size.height/3.7,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/servicehomebg.png'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0,),

            Padding(
              padding:  EdgeInsets.symmetric(vertical: 14.0,horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('Explore our services',style: TextStyle(fontSize: 15.3,fontWeight: FontWeight.normal),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicesGridScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text('See more'),
                        Icon(Icons.arrow_forward_ios_rounded,size: 12.0,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
           ExploreServicesList(),

            SizedBox(width: 12.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending around me',style: TextStyle(fontSize: 15.3,fontWeight: FontWeight.normal),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrendingServicesScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text('View'),

                           Icon(Icons.arrow_forward_ios_rounded,size: 12.0,),

                      ],
                    ),
                  ),
                ],
              ),
            ),

           TrendingServicesList(),

            Container(
              height: MediaQuery.of(context).size.height/10.2,
              width: MediaQuery.of(context).size.width/1.01,
              decoration: BoxDecoration(
                color: Color.fromRGBO(20, 85, 249, 2),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      height: 140,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/servicescheckmark.png')
                        )
                      ),
                    ),


                    Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Satisfaction is guaranteed',style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: Text('Our Service providers are trained professionals that are well vetted and verified by our team of excellent service and sector leaders',style: TextStyle(fontSize: 10.0,color: Colors.white),)),
                      ],
                    ),
                  ],
                ),
              ),
              ),


          ],

        ),
      ),
    );
  }
}
