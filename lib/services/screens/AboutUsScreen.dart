import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_services.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.aboutUs();
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
        body: Container(
          color: Colors.yellow,
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:SafeArea(
              child: Container(
                height: screenheight,
                width: screenwidth,
                color: Colors.green,
                padding: EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(12.0),
                        color: Colors.grey,
                        child: Consumer<ProviderServices>(
                          builder: (_, provider, __) {
                            print('object ${provider.aboutUsModel}');
                            if (provider.aboutUsModel?.data == null) {
                              return const CircularProgressIndicator();
                            } else {
                              return
                                Column(
                                    children:  [
                                      Text('About Us'),
                                      SizedBox(height: 12.0,),

                                      Text(provider.aboutUsModel?.data?.description ?? ''),

                                    ]

                                );

                          }
                          },
                        ),






                      ),

                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
