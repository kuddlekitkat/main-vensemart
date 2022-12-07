import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:vensemart/products/widgets/components/CartCard.dart';
import 'package:vensemart/products/widgets/components/CompletedOrderList.dart';
import 'package:vensemart/products/widgets/components/OrderList.dart';
import 'package:vensemart/products/widgets/components/OrderListCard.dart';

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


class ProductOrderListScreen extends StatefulWidget {

  const ProductOrderListScreen({super.key});

  @override
  _ProductOrderListScreenState createState() => _ProductOrderListScreenState();
}

class _ProductOrderListScreenState extends State<ProductOrderListScreen> {

  final _selectedSegment_05 = ValueNotifier('all');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.white,

                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: Center(
                          child: AdvancedSegment(
                            controller: _selectedSegment_05,
                            segments: const {
                              'all': 'Active Orders',
                              'missed': 'Completed Orders',
                            },
                            backgroundColor: Colors.white10,
                            activeStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,

                            ),
                            inactiveStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            sliderColor: Color(0xff1456f1),
                          ),
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: _selectedSegment_05,
                        builder: (_, key, __) {
                          switch (key) {
                            case 'all':
                              return const OrderList();
                            case 'missed':
                              return const CompletedOrderList();
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