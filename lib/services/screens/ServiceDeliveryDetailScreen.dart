import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/screens/ServicesSuccessScreen.dart';
import 'package:vensemart/services/screens/SetAddressScreen.dart';

import '../../ChoiceIntroScreen.dart';
import '../provider/provider_services.dart';

class ServiceDeliveryDetailScreen extends StatefulWidget {
  String service_name;
   String service_id;
  String service_date;
  ServiceDeliveryDetailScreen({required this.service_name, required this.service_date, required this.service_id});

  @override
  State<ServiceDeliveryDetailScreen> createState() => _ServiceDeliveryDetailScreenState();
}

class _ServiceDeliveryDetailScreenState extends State<ServiceDeliveryDetailScreen> {

  ProviderServices? providerServices;
  late String servicename;
  late String name;
  TextEditingController timeController = TextEditingController();

  late DateTime _selectedDate;


  TextEditingController _textEditingController = TextEditingController();


  @override
  void initState() {

    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.serviceId(widget.service_id.toString());
    providerServices?.userLocation();
    providerServices?.userDetails();
    super.initState();
  }

  void addBooking(context) async {
    if (true) {
      setState(() {});
      providerServices?.addNewBooking(map: {
        "service_provider_id" : widget.service_id.toString(),
        "booking_date" : widget.service_name,
        "booking_time" : widget.service_date,
      }, context: context);

      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => const ServicesSuccessScreen(),
        ),
      );

    }
  }


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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Consumer<ProviderServices>(
            builder: (_, provider, __) {
              print('object ${provider.serviceIdModel?.data}');
              if (provider.serviceIdModel?.data == 'null') {
                return const Text('No completed Requests');
              } else {

                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Address Details'),
                              TextButton(
                                onPressed: (){
                                   addAddress(context);
                                },
                                child: Text('CHANGE',style: TextStyle(color: Colors.blueAccent)),),
                            ],
                          ),
                        ),

                        Container(
                            height: screenHeight / 4.5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.0),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: provider?.userLocationModel?.data?.location.toString() != null ?
                               Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text('${provider?.userDetailsModel?.data?.name}',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${provider?.userLocationModel?.data?.location}'),
                                  Text('${provider?.userDetailsModel?.data?.mobile}'),


                                ],
                              ) : Text('no address found')
                            ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Services Ordered'),
                            ],
                          ),
                        ),







                        Container(
                            height: screenHeight / 4.5,
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
                                  Text('SERVICE 1 of 1' ,style: TextStyle(fontSize: 16),),
                                  Text(widget.service_date.toString()),
                                  Text(widget.service_name.toString()),
                                  Text('Service to be rendered by: ${providerServices?.serviceIdModel?.data?.name}'),


                                ],
                              ),
                            )
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                          child: Column(
                            children: [


                              Container(
                                height: screenHeight/13,
                                width: screenWidth/1.10,
                                decoration: BoxDecoration(
                                  color: Color(0xff1456f1),
                                  borderRadius: BorderRadius.circular(40.0),

                                ),


                                child:   provider?.userLocationModel?.data?.location.toString() != null ?
                                GestureDetector(
                                  onTap: () => addBooking(context),
                                  child: Consumer<ProviderServices>(
                                    builder: (_, provider, __) => Container(
                                      height: screenHeight / 13,
                                      width: screenWidth / 1.07,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1456f1),
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: provider.isLoading == true
                                          ? const SpinKitCircle(
                                        color: Colors.white,
                                      )
                                          : const Center(
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20.0),
                                          )),
                                    ),
                                  ),
                                ) : GestureDetector(
                                  onTap: () => addAddress(context),
                                  child: Consumer<ProviderServices>(
                                    builder: (_, provider, __) => Container(
                                      height: screenHeight / 13,
                                      width: screenWidth / 1.07,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1456f1),
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: provider.isLoading == true
                                          ? const SpinKitCircle(
                                        color: Colors.white,
                                      )
                                          : const Center(
                                          child: Text(
                                            'Add Address',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20.0),
                                          )),
                                    ),
                                  ),
                                ),
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

        ),
      ),
    );
  }

  addAddress(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) =>  AddAddressScreen(service_name: widget.service_name,service_id: widget.service_id, service_date: widget.service_date,),
      ),
    );

  }
}
