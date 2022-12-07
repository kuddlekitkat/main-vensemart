import 'package:flutter/material.dart';
import 'package:vensemart/services/widgets/components/AvailableServicesBottomListView.dart';
import 'package:vensemart/services/widgets/components/ServiceCard.dart';

class AvailableServicesListScreen extends StatefulWidget {
  static const routeName = '/available-services';

  const AvailableServicesListScreen({Key? key}) : super(key: key);

  @override
  State<AvailableServicesListScreen> createState() => _AvailableServicesListScreenState();
}

class _AvailableServicesListScreenState extends State<AvailableServicesListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 3),
      appBar: AppBar(

        elevation: 0.00,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(11.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintText: 'Barber',
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    fillColor: Color.fromRGBO(250,250,254,1),),
                ),
              ),

                ServiceCard(image: 'assets/images/availableservice1.png',redStars: 5, blackStars: 0,location: 'Abuja Area 11',),
              SizedBox(height: 12.0,),
              ServiceCard(image: 'assets/images/availableservice2.png',redStars: 4, blackStars: 1,location: 'Abuja Lugbe'),
              SizedBox(height: 12.0,),
              ServiceCard(image: 'assets/images/availableservice3.png',redStars: 3, blackStars: 2,location: 'Abuja Jayi'),
              SizedBox(height: 12.0,),

              ServiceCard(image: 'assets/images/availableservice4.png',redStars: 4, blackStars: 1,location: 'Abuja Apo',),
              SizedBox(height: 12.0,),

              AvailableServicesBottomListView(),





            ],
          ),
        ),
      ),
    );
  }
}
