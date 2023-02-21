import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_services.dart';

class LocationDisclaimerScreen extends StatefulWidget {
  const LocationDisclaimerScreen({Key? key}) : super(key: key);

  @override
  State<LocationDisclaimerScreen> createState() =>
      _LocationDisclaimerScreenState();
}

class _LocationDisclaimerScreenState extends State<LocationDisclaimerScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    // providerServices?.LocationDisclaimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(234, 234, 234, 3),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          color: Color.fromRGBO(234, 234, 234, 3),
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: Container(
              height: screenheight,
              width: screenwidth,
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          child: Column(children: const [
                            Text('Location Disclaimer'),
                            SizedBox(
                              height: 12.0,
                            ),

                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                " Vensemart collects location data to get closest service providers around you and tailor notifications and"
                                "advertisements to make your experience on the better",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 20.0,
                            ),

                            // Text( "It enables the end users to access closest and "
                            //     "reliable services within 3 minutes of location proximity,"
                            //     " book and manage appointments at convenience and avoid "
                            //     "queuing at public outlet for service needs with a relaxed "
                            //     "and first class user experience."),
                            // SizedBox(height: 12.0,),
                            //
                            // Text("Vensemart Apps encourages business growth"
                            //     " and curbs the increasing rate of job lost and global economic downturn, networknig onckexpon dingines%h realm economy (freelancing) to the corporate companies."),
                          ]),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
