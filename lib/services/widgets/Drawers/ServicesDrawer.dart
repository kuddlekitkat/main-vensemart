import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/ProductsComingSoon.dart';
import 'package:vensemart/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/screens/AboutUsScreen.dart';
import 'package:vensemart/services/screens/ContactScreen.dart';
import 'package:vensemart/services/screens/CustomerSupportScreen.dart';
// import 'package:vensemart/services/screens/FeedbackScreen.dart';
import 'package:vensemart/services/screens/NotificationScreen.dart';
import 'package:vensemart/services/screens/ProfileEditScreen.dart';
import 'package:vensemart/services/screens/RateUsScreen.dart';
import 'package:vensemart/services/screens/ReferralsScreen.dart';
import 'package:vensemart/services/screens/ServicesAppoinmentScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';
import 'package:vensemart/services/widgets/full_pages/ServiceHome.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/session_manager.dart';
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
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Consumer<ProviderServices>(builder: (_, provider, __) {
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
                        // backgroundImage: NetworkImage(
                        //     "${provider.userDetailsModel?.data?.profile}"),
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
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      left: 20,
                      child: AutoSizeText(
                        '${provider.userDetailsModel?.data?.name}',
                        textScaleFactor: MediaQuery.textScaleFactorOf(context),
                        minFontSize: 5,
                        style: TextStyle(
                            fontSize: 2 * unitHeightValue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Your Profile',
                      style: TextStyle(
                          fontSize: 2 * unitHeightValue,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue),
                    )),
                SizedBox(
                  height: 20.0,
                ),
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
                                  builder: (context) => ServicesHomeScreen()),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.menu),
                            title: AutoSizeText(
                              'Home',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
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
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: AutoSizeText(
                              'Profile',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsHomeScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.compare_arrows),
                            title: AutoSizeText(
                              'Switch to product',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReferralsScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.code),
                            title: AutoSizeText(
                              'Referrals',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               ServicesAppointmentScreen()),
                        //     );
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(Icons.notifications),
                        //     title: AutoSizeText('Booking History'),
                        //   ),
                        // ),

                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => ProductsHomeScreen()),
                        //     );
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(Icons.notifications),
                        //     title: AutoSizeText('Switch to Working product'),
                        //   ),
                        // ),

                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => ProductComingSoonScreen(),
                        //       ),
                        //     );
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(Icons.compare_arrows),
                        //     title: AutoSizeText('Switch to product'),
                        //   ),
                        // ),
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
                        //     title: AutoSizeText('Notifications'),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactUsScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.phone),
                            title: AutoSizeText(
                              'Contact',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
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
                            title: AutoSizeText(
                              'About',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
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
                        //     title: AutoSizeText('Feedback'),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerSupportScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.support_agent),
                            title: AutoSizeText(
                              'Support',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () async {
                        //     final InAppReview inAppReview = InAppReview.instance;
                        //
                        //     if (await inAppReview.isAvailable()) {
                        //     inAppReview.requestReview();
                        //     }
                        //   },
                        //   child: const ListTile(
                        //     leading: Icon(
                        //       Icons.rate_review,),
                        //     title: AutoSizeText('Rating'),
                        //   ),
                        // ),

                        GestureDetector(
                          onTap: () {
                            SessionManager.instance.logOut();
                            Navigator.pushReplacement(
                              context!,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout_outlined,
                              color: Colors.redAccent,
                            ),
                            title: AutoSizeText(
                              'Logout',
                              style: TextStyle(fontSize: 1.5 * unitHeightValue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
