import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/ProductsComingSoon.dart';
import 'package:vensemart/core/session_manager.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ProfileEditScreen.dart';
import 'package:vensemart/services/screens/ServicesAppoinmentScreen.dart';

import '../../LoginScreen.dart';
import '../../products/screens/ProductsHomeScreen.dart';
import 'AboutUsScreen.dart';
import 'ContactScreen.dart';
// import 'FeedbackScreen.dart';
import 'NotificationScreen.dart';
import 'RateUsScreen.dart';
import 'ServicesHomeScreen.dart';

class ServicesProfileScreen extends StatefulWidget {
  const ServicesProfileScreen({Key? key}) : super(key: key);

  @override
  State<ServicesProfileScreen> createState() => _ServicesProfileScreenState();
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 10, 120, 120);
  }

  bool shouldReclip(oldClipper) {
    return true;
  }
}

class _ServicesProfileScreenState extends State<ServicesProfileScreen> {
  ProviderServices? _providerServices;

  @override
  void initState() {
    _providerServices = Provider.of<ProviderServices>(context, listen: false);
    _providerServices?.userDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.blueAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      child: CircleAvatar(
                        radius: 50.0,
                        // backgroundImage:
                        //     NetworkImage("${provider.userDetailsModel?.data?.profile} ?? '' "),
                        child: CachedNetworkImage(
                          imageUrl: provider.userDetailsModel?.data?.profile
                                  .toString() ??
                              '',
                          imageBuilder: (context, imageProvider) => Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Text(
                          provider.userDetailsModel?.data?.name ?? '',
                          style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 33, 33, 243)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileEditScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Your Profile',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: const Color.fromRGBO(237, 234, 234, 22),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicesHomeScreen()),
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
                                  builder: (context) => ProfileEditScreen()),
                            );
                          },
                          child: const ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Profile'),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: (){
                        //
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => ServicesAppointmentScreen()
                        //       ),
                        //     );
                        //
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(Icons.notifications),
                        //     title: Text('Booking History'),
                        //   ),
                        // ),
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
                        //   onTap: (){
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
                        //   onTap: (){
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const FeedbackScreen(),
                        //       ),
                        //     );
                        //
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(Icons.chat),
                        //     title: Text('Feedback'),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: (){
                        //
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const RateUsScreen(),
                        //       ),
                        //     );
                        //
                        //
                        //
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
                              Icons.logout_outlined,
                              color: Colors.redAccent,
                            ),
                            title: Text('Logout'),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //     showAlertDialog(context);
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(
                        //       Icons.delete_forever,
                        //       color: Colors.redAccent,
                        //     ),
                        //     title: Text('Delete Account'),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void deleteAccount() {
    _providerServices?.deleteAccount(map: {
      "user_id": "${_providerServices?.userDetailsModel?.data?.id}",
    }, context: context);

    SessionManager.instance.logOut();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("YES"),
      onPressed: () {
        deleteAccount();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("NO"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Account Deletion Disclaimer"),
      content: Text("Would you like to delete your account forever?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
