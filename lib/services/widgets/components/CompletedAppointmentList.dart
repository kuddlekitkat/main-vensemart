import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/widgets/components/CompletedAppointmentCard.dart';

import '../../provider/provider_services.dart';

class CompletedAppointmentList extends StatefulWidget {
  const CompletedAppointmentList({Key? key}) : super(key: key);

  @override
  State<CompletedAppointmentList> createState() => _CompletedAppointmentListState();
}

class _CompletedAppointmentListState extends State<CompletedAppointmentList> {


  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllCompletedBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(
        builder: (_, provider, __) {
      print('object ${provider.completedBooking?.data}');
      if (provider.completedBooking?.message == null) {
        return Center(child: SpinKitCircle(color: Colors.blue,));
      } else {






          return Column(
          children: [

            ...provider.completedBooking!.data!.map((e) {
              print('print e for me $e');

              return CompletedAppointmentCard(
                completedBooking: e,image: 'assets/images/upcoming1.png',name: 'Amarachi', occupation: 'barber');


            }).toList()




          ],
        );






      }
        }
    );
  }
}
