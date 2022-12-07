import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/ServiceDetailScreen.dart';
import 'package:vensemart/services/widgets/components/TrendingServicesImage.dart';

class TrendingServicesList extends StatefulWidget {
  const TrendingServicesList({Key? key}) : super(key: key);

  @override
  State<TrendingServicesList> createState() => _TrendingServicesListState();
}

class _TrendingServicesListState extends State<TrendingServicesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 12.0,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(),
                ),
              );
            },
            child: Column(
              children: const [
                TrendingServicesImage(image: 'assets/images/trendingservice1.png'),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Clever Spa'),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(),
                ),
              );
            },
            child: Column(
              children: const [
               TrendingServicesImage(image: 'assets/images/trendingservice2.png',),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Ali Cleaning'),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(),
                ),
              );
            },
            child: Column(
              children: const [
                TrendingServicesImage(image: 'assets/images/trendingservice3.png',),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Amarachi'),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(),
                ),
              );
            },
            child: Column(
              children: const [
                TrendingServicesImage(image: 'assets/images/trendingservice4.png',),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Hairstyling'),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.0,),

        ],
      ),
    );
  }
}
