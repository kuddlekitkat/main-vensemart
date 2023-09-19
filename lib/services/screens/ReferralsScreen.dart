import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../provider/provider_services.dart';

class ReferralsScreen extends StatefulWidget {
  @override
  _ReferralsScreenState createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  ProviderServices? providerServices;
  late TextEditingController _referralCodeController;
  late TextEditingController _linkController;

  @override
  void initState() {
    _referralCodeController = TextEditingController();
    _linkController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.referrals();
    providerServices?.refUserslist();
    _referralCodeController.text = providerServices?.referralsModel?.data?.referral_code ?? '';
    _linkController.text = "https://api.vensemart.com/api/ref?=${providerServices?.referralsModel?.data?.referral_code}";
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _referralCodeController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _copyReferralCode(String referralCode) {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Referral code copied to clipboard')),
    );
  }

  void _copyLink(String link) {
    Clipboard.setData(ClipboardData(text: link));
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Link copied to clipboard')),
    );
  }

  void shareText(String text) {
    Share.share(text);
  }


  @override
  Widget build(BuildContext context) {
    _referralCodeController = TextEditingController(text: providerServices?.referralsModel?.data?.referral_code ?? '');
    _linkController = TextEditingController(text: "https://api.vensemart.com/api/ref?=${providerServices?.referralsModel?.data?.referral_code}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1456F1),
        title: Text(
          'Referrals',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            if (provider.referralsModel == null) {
              return Center(
                child: SpinKitCircle(
                  color: Colors.blue[900],
                  size: 50,
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Refer friends and earn handsome rewards',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),

                    // IconButton(
                    //   onPressed: () {
                    //     String textToShare =
                    //         'pls download the vensemart app and register to get rewards, here is the link to app,${_linkController.text}, when registering, kindly enter my referral code ${providerServices?.referralsModel?.data?.referral_code}';
                    //     shareText(textToShare);
                    //   },
                    //   icon: Icon(Icons.share),
                    //   tooltip: 'Share',
                    // ),

                    SizedBox(height: 20),
                    Text(
                      'Your Referral Code:',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _referralCodeController,
                            readOnly: true,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.copy),
                        //   onPressed: () => _copyReferralCode(_referralCodeController.text),
                        // ),
                        IconButton(
                          onPressed: () {
                            String textToShare =
                                'pls download the vensemart app and register to get rewards, here is the link to app, ${_linkController.text}, when registering, kindly enter my referral code "${providerServices?.referralsModel?.data?.referral_code}"';
                            shareText(textToShare);
                          },
                          icon: Icon(Icons.share),
                          tooltip: 'Share',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Link to App:',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _linkController,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.link),
                        //   onPressed: () => _copyLink(_linkController.text),
                        // ),
                        IconButton(
                          onPressed: () {
                            String textToShare =
                                'pls download the vensemart app and register to get rewards, here is the link to app, ${_linkController.text}, when registering, kindly enter my referral code "${providerServices?.referralsModel?.data?.referral_code}"';
                            shareText(textToShare);
                          },
                          icon: Icon(Icons.share),
                          tooltip: 'Share',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    if (provider.referralsModel!.data != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 12),
                          if (provider.referralsModel!.data!.referrals!.isEmpty)
                            Text(
                              'You have no referrals yet.',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.5,
                                  color: Colors.black87,
                                ),
                              ),
                            ),

                          ExpansionTile(
                            title: Text('Referrals'),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: provider.referralsModel!.data!.referrals!.length,
                                itemBuilder: (_, index) {
                                  final referral = provider.referralsModel!.data!.referrals![index];
                                  return ListTile(
                                    leading: Icon(Icons.person, size: 24),
                                    title: Text(
                                      referral['name'],
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Text(
                                      referral['email'],
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),



                          SizedBox(height: 12),
                          if (provider.referredUsersBookingModel!.data!.user!.isEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),

                                Text(
                                  'All Referrals with service booking:',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'None of your referred users have booked a service yet',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 16),
                                  ),
                                ),
                                // Rest of the code...
                              ],
                            ),


                          ExpansionTile(
                            title: Text('Referred Users'),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: provider.referredUsersBookingModel!.data!.user!.length,
                                itemBuilder: (_, index) {
                                  final referralUser = provider.referredUsersBookingModel!.data!.user![index];
                                  return ListTile(
                                    leading: Icon(Icons.person, size: 24),
                                    title: Text(
                                      '${referralUser.name}',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${referralUser.name}',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),


                          if (provider.referredUsersBookingModel!.data!.earningUser!.isEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Referrals with completed services:',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'None of your referred users have completed a booking yet',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 16),
                                  ),
                                ),
                                // Rest of the code...
                              ],
                            ),


                          ExpansionTile(
                            title: Text('Earning Users'),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: provider.referredUsersBookingModel!.data!.earningUser!.length,
                                itemBuilder: (_, index) {
                                  final referralUser = provider.referredUsersBookingModel!.data!.earningUser![index];
                                  return ListTile(
                                    leading: Icon(Icons.person, size: 24),
                                    title: Text(
                                      '${referralUser.name}',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${referralUser.name}',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),


                        ],
                      ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
