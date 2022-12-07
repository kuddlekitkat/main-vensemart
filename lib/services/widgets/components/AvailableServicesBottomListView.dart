import 'package:flutter/material.dart';

import '../../screens/AvailableServicesListScreen.dart';

class AvailableServicesBottomListView extends StatelessWidget {
  const AvailableServicesBottomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 3.0,),
          Container(
            height: MediaQuery.of(context).size.height/5.5,
            width:MediaQuery.of(context).size.width/1.5,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/images/proj.png'),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 3.0,),
          Container(
            height: MediaQuery.of(context).size.height/5.5,
            width:MediaQuery.of(context).size.width/1.5,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/images/proj.png'),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 3.0,),
          Container(
            height: MediaQuery.of(context).size.height/5.5,
            width:MediaQuery.of(context).size.width/1.5,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/images/proj.png'),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 3.0,),
          Container(
            height: MediaQuery.of(context).size.height/5.5,
            width:MediaQuery.of(context).size.width/1.5,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/images/proj.png'),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),

          SizedBox(width: 3.0,),
        ],
      ),
    );
  }
}
