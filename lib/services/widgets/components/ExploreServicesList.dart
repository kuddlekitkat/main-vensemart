import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/ServiceDeliveryDetailScreen.dart';

import '../../screens/AvailableServicesListScreen.dart';

class ExploreServicesList extends StatefulWidget {
  const ExploreServicesList({Key? key}) : super(key: key);

  @override
  State<ExploreServicesList> createState() => _ExploreServicesListState();
}

class _ExploreServicesListState extends State<ExploreServicesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 25.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AvailableServicesListScreen(),
                ),
              );
            },
            child: Container(
              height: 120.0,
              width: 90.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/exploreservices1.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AvailableServicesListScreen(),
                ),
              );
            },
            child: Container(
              height: 120.0,
              width: 90.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/exploreservices2.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AvailableServicesListScreen(),
                ),
              );
            },
            child: Container(
              height: 120.0,
              width: 90.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/exploreservices3.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AvailableServicesListScreen(),
                ),
              );
            },
            child: Container(
              height: 40.0,
              width: 80.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/exploreservices4.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
      ),
    );
  }
}
