import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';

class ServicesProfileScreen extends StatefulWidget {
  const ServicesProfileScreen({Key? key}) : super(key: key);

  @override
  State<ServicesProfileScreen> createState() => _ServicesProfileScreenState();
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 10, 120, 120);
  }

  bool shouldReclip(oldClipper) {
    return true;
  }
}

class _ServicesProfileScreenState extends State<ServicesProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children:  [
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.blueAccent,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/profileimg.png"),
                    ),
                  ),

                ],
              ),


              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Your Profile',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),)),
              SizedBox(height: 20.0,),
              Container(
                color: Color.fromRGBO(237, 234, 234, 22),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AvailableServicesListScreen(),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.menu),
                          title: Text('Home'),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                      ),

                      const ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Booking History'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.compare_arrows),
                        title: Text('Switch to product'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Notifications'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('contact'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                      ),

                      const ListTile(
                        leading: Icon(Icons.chat),
                        title: Text('Feedback'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.rate_review_rounded),
                        title: Text('Rate our app'),
                      ),
                      const ListTile(
                        leading:Icon(Icons.logout_outlined,color: Colors.redAccent,),
                        title: Text('Logout'),
                      ),

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );

  }

}
