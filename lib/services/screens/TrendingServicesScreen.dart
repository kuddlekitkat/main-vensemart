import 'package:flutter/material.dart';
import 'package:vensemart/products/widgets/components/OrderListCard.dart';
import 'package:vensemart/services/widgets/components/AppointmentCard.dart';
import 'package:vensemart/services/widgets/components/ServiceCard.dart';
import 'package:vensemart/services/widgets/components/TrendingServicesCard.dart';

class TrendingServicesScreen extends StatefulWidget {
  const TrendingServicesScreen({Key? key}) : super(key: key);

  @override
  State<TrendingServicesScreen> createState() => _TrendingServicesScreenState();
}

class _TrendingServicesScreenState extends State<TrendingServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247,248,254,5),
      appBar: AppBar(
        title: Text('Trending services',style: TextStyle(color: Colors.grey),),
        elevation: 0.00,
        backgroundColor: Color.fromRGBO(247,248,254,5),
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:   [
              SizedBox(height: 20.0,),
            TrendingServicesCard(image: 'assets/images/trendingnearby1.png', name: 'Amarachi', services: 'haircut', jobs: '14',redStars: 5,blackStars: 0),
              SizedBox(height: 30,),
              TrendingServicesCard(image: 'assets/images/trendingnearby2.png', name: 'Promise solar', services: 'Solar Installers', jobs: '3',redStars: 4,blackStars: 1),
              SizedBox(height: 30,),
              TrendingServicesCard(image: 'assets/images/trendingnearby3.png', name: 'Aisha beauty', services: 'Spa', jobs: '14',redStars: 3,blackStars: 2),
              SizedBox(height: 30,),
              TrendingServicesCard(image: 'assets/images/trendingnearby4.png', name: 'Amerigo Laundry', services: 'Laundry', jobs: '14',redStars: 4,blackStars: 1),
              SizedBox(height: 30,),
              TrendingServicesCard(image: 'assets/images/trendingnearby5.png', name: 'Nano tech', services: 'Alarm system installation', jobs: '14',redStars: 2,blackStars: 3),
              SizedBox(height: 30,),
              TrendingServicesCard(image: 'assets/images/trendingnearby6.png', name: 'Emmo welders', services: 'welding', jobs: '132',redStars: 2,blackStars: 3),
            ],
          ),
        ),
      ),
    );
  }
}
