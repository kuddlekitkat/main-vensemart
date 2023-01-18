import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/ProductsComingSoon.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/screens/AboutUsScreen.dart';
import 'package:vensemart/services/screens/ContactScreen.dart';
import 'package:vensemart/services/screens/FeedbackScreen.dart';
import 'package:vensemart/services/screens/NotificationScreen.dart';
import 'package:vensemart/services/screens/ProfileEditScreen.dart';
import 'package:vensemart/services/screens/RateUsScreen.dart';
import 'package:vensemart/services/screens/ServicesAppoinmentScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';
import 'package:vensemart/services/widgets/full_pages/ServiceHome.dart';

import '../../provider/provider_services.dart';
import '../../screens/AvailableServicesListScreen.dart';

class ServicesDrawer extends StatefulWidget {
  const ServicesDrawer({Key? key}) : super(key: key);

  @override
  State<ServicesDrawer> createState() => _ServicesDrawerState();
}

class _ServicesDrawerState extends State<ServicesDrawer> {
  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.userDetails();
    super.initState();
  }

void Logout() async {

  // providerServices?.signOut();
  setState(() {
    providerServices?.signOut();
  });

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => LoginScreen(),
  //   ),
  // );


}



  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Consumer<ProviderServices>(
         builder: (_, provider, __) {
           return SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Stack(
                   children: [
                     Container(
                       height: 80,
                       width: double.infinity,
                       color: Colors.blueAccent,
                     ),
                      Padding(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.0, vertical: 40.0),
                       child: CircleAvatar(
                         radius: 50.0,
                         backgroundImage: NetworkImage(
                             "${provider.userDetailsModel?.data?.profile}"),
                       ),
                     ),


                      Positioned(
                       top: 140,
                       left: 20,
                       child: Text('${provider.userDetailsModel?.data?.name}', style: TextStyle(
                           fontSize: 22.0, fontWeight: FontWeight.bold),),
                     ),


                   ],
                 ),

                 Container(
                     padding: EdgeInsets.only(left: 20.0),
                     child: Text('Your Profile', style: TextStyle(
                         fontSize: 15.0, fontWeight: FontWeight.normal),)),
                 SizedBox(height: 20.0,),
                 Container(
                   color: Color.fromRGBO(237, 234, 234, 22),
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 40.0),
                     child: Column(
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => ServicesHomeScreen()
                               ),
                             );
                           },
                           child: const ListTile(
                             leading: Icon(Icons.menu),
                             title: Text('Home'),
                           ),
                         ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => ProfileEditScreen()
                               ),
                             );
                           },
                           child: const ListTile(
                             leading: Icon(Icons.person),
                             title: Text('Profile'),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                       ServicesAppointmentScreen()
                               ),
                             );
                           },
                           child: const ListTile(
                             leading: Icon(Icons.notifications),
                             title: Text('Booking History'),
                           ),
                         ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => ProductComingSoonScreen(),
                               ),
                             );
                           },
                           child: const ListTile(
                             leading: Icon(Icons.compare_arrows),
                             title: Text('Switch to product'),
                           ),
                         ),
                         // GestureDetector(
                         //   onTap: () {
                         //     Navigator.push(
                         //       context,
                         //       MaterialPageRoute(
                         //         builder: (context) => NotificationScreen(),
                         //       ),
                         //     );
                         //   },
                         //   child: const ListTile(
                         //     leading: Icon(Icons.notifications),
                         //     title: Text('Notifications'),
                         //   ),
                         // ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => ContactScreen(),
                               ),
                             );
                           },

                           child: const ListTile(
                             leading: Icon(Icons.phone),
                             title: Text('contact'),
                           ),
                         ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => const AboutUsScreen(),
                               ),
                             );
                           },
                           child: ListTile(
                             leading: Icon(Icons.info),
                             title: Text('About'),
                           ),
                         ),

                         // GestureDetector(
                         //   onTap: () {
                         //     Navigator.push(
                         //       context,
                         //       MaterialPageRoute(
                         //         builder: (context) => const FeedbackScreen(),
                         //       ),
                         //     );
                         //   },
                         //   child: const ListTile(
                         //     leading: Icon(Icons.chat),
                         //     title: Text('Feedback'),
                         //   ),
                         // ),
                         // GestureDetector(
                         //   onTap: () {
                         //     Navigator.push(
                         //       context,
                         //       MaterialPageRoute(
                         //         builder: (context) => const RateUsScreen(),
                         //       ),
                         //     );
                         //   },
                         //   child: const ListTile(
                         //     leading: Icon(Icons.rate_review_rounded),
                         //     title: Text('Rate our app'),
                         //   ),
                         // ),
                         GestureDetector(
                           onTap: () {
                             Navigator.pushReplacement(
                               context!,
                               MaterialPageRoute(
                                 builder: (context) => const LoginScreen(),
                               ),
                             );
                           },
                           child: const ListTile(
                             leading: Icon(
                               Icons.logout_outlined, color: Colors.redAccent,),
                             title: Text('Logout'),
                           ),
                         ),

                       ],
                     ),
                   ),
                 )

               ],
             ),
           );
         }
        ),
      ),
    );
  }
}
