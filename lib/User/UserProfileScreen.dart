import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 10, 120, 120);
  }

  bool shouldReclip(oldClipper) {
    return true;
  }
}

class _UserProfileScreenState extends State<UserProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 80.0),
                  child: ClipOval(
                    clipper: MyClip(),
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFWYXoT82R6VsoCOXzgGh2IJEMT4Nf6kV62Us8IxJk&s",
                        fit: BoxFit.fill
                    ),
                  ),
                ),


                Positioned(
                   top: 210,
                    left: 12,
                    child: Text('James Thew',style: TextStyle(fontSize: 30.0,fontStyle: FontStyle.normal,),),
                ),
                Positioned(
                  top: 260,
                  left: 12,
                  child: Text('Your Profile',style: TextStyle(fontSize: 25.0,fontStyle: FontStyle.normal,color: Colors.blue),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                  child: Container(
                    height: 50.0,
                      width: 50.0,
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0)
                      ),
                      child: Icon(Icons.arrow_back,size: 50.0,color: Colors.black,)),
                ),
              ],
            ),



            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Booking History'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Switch to product'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Notifications'),
            ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('contact'),
            // ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('About'),
            // ),
            //
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Feedback'),
            // ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Rate our app'),
            // ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Logout'),
            // ),



          ],
        ),
      ),
    );

  }

}
