import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:vensemart/services/widgets/components/AppointmentCard.dart';
import 'package:vensemart/services/widgets/components/AppointmentList.dart';
import 'package:vensemart/services/widgets/components/CompletedAppointmentCard.dart';
import 'package:vensemart/services/widgets/components/CompletedAppointmentList.dart';


enum Segment {
  all,
  starred,
}

extension SegmentsExtension on Segment {
  String get label {
    switch (this) {
      case Segment.all:
        return 'All Files';
      case Segment.starred:
        return 'Starred Files';
      default:
        return 'Unrecognized';
    }
  }

  bool get isAll => this == Segment.all;

  bool get isStarred => this == Segment.starred;
}


class ServicesAppointmentScreen extends StatefulWidget {


  const ServicesAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<ServicesAppointmentScreen> createState() => _ServicesAppointmentScreenState();
}

class _ServicesAppointmentScreenState extends State<ServicesAppointmentScreen> {
  final _selectedSegment_05 = ValueNotifier('all');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.white,

                  child: Column(
                    children: [

                      SizedBox(height: 5.0,),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: Center(
                          child: AdvancedSegment(
                            controller: _selectedSegment_05,
                            segments: const {
                              'all': 'Upcoming',
                              'missed': 'Completed',
                              'cancelled':'Cancelled'
                            },
                            backgroundColor: Colors.white10,
                            activeStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,

                            ),
                            inactiveStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            sliderColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: _selectedSegment_05,
                        builder: (_, key, __) {
                          switch (key) {
                            case 'all':
                              return const AppointmentList();
                            case 'missed':
                              return const CompletedAppointmentList();
                            case 'cancelled':
                              return const CompletedAppointmentList();
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(
      String label, {
        Color color = Colors.black87,
      }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                color: color,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
          Expanded(
              child: Divider(
                color: color,
              )),
        ],
      ),
    );
  }
}
