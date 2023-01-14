import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/widgets/components/AppointmentCard.dart';

import '../../provider/provider_services.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {


  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllUpcomingBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(
        builder: (_, provider, __) {
          print('object ${provider.upcomingBooking?.data}');
          if (provider.upcomingBooking?.message == null) {
            return Center(child: SpinKitCircle(color: Colors.blue,));
          } else {






            return Column(
              children: [

                ...provider.upcomingBooking!.data!.map((e) {
                  print('print e for me $e');

                  return AppointmentCard(
                      upcomingBooking: e,image: 'assets/images/upcoming1.png',name: 'Amarachi', occupation: 'barber');


                }).toList()




              ],
            );






          }
        }
    );
  }
}
