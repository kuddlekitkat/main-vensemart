import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/widgets/components/CancelledAppointmentList.dart';

import '../../../models/canceled_bookings.dart';
import '../../provider/provider_services.dart';
import 'CancelledAppointmentCard.dart';

class CancelledAppointmentList extends StatefulWidget {
  const CancelledAppointmentList({Key? key}) : super(key: key);

  @override
  State<CancelledAppointmentList> createState() => _CancelledAppointmentListState();
}

class _CancelledAppointmentListState extends State<CancelledAppointmentList> {


  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllCanceledBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(
        builder: (_, provider, __) {
      print('object ${provider.cancelledBooking?.data}');
      if (provider.cancelledBooking?.message == null) {
        return Center(child: SpinKitCircle(color: Colors.blue,));
      } else {






          return Column(
          children: [

            ...provider.cancelledBooking!.data!.map((e) {
              print('print e for me $e');

              return CancelledAppointmentCard(
                CancelledBooking: e,image: 'assets/images/upcoming1.png',name: 'Amarachi', occupation: 'barber');


            }).toList()




          ],
        );






      }
        }
    );
  }
}
