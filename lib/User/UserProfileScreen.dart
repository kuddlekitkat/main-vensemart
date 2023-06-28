import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 80.0),
                  child: ClipOval(
                    clipper: MyClip(),
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFWYXoT82R6VsoCOXzgGh2IJEMT4Nf6kV62Us8IxJk&s",
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 12,
                  child: AutoSizeText(
                    'James Thew',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 12,
                  child: AutoSizeText(
                    'Your Profile',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Icon(
                        Icons.arrow_back,
                        size: 50.0,
                        color: Colors.black,
                      )),
                ),
              ],
            ),

            ListTile(
              leading: Icon(Icons.menu),
              title: AutoSizeText('Home'),
            ),
            ListTile(
              leading: Image.asset('assets/images/worker-image.jpeg'),
              title: AutoSizeText('Profile'),
            ),
            ListTile(
              leading: Image.asset('assets/images/worker-image.jpeg'),
              title: AutoSizeText('Booking History'),
            ),
            ListTile(
              leading: Image.asset('assets/images/worker-image.jpeg'),
              title: AutoSizeText('Switch to product'),
            ),
            ListTile(
              leading: Image.asset('assets/images/worker-image.jpeg'),
              title: AutoSizeText('Notifications'),
            ),
            // ListTile(
            //   leading: Image.asset('assets/images/worker-image.jpeg');
            //   title: AutoSizeText('contact'),
            // ),
            // ListTile(
            //   leading: Image.asset('assets/images/worker-image.jpeg');
            //   title: AutoSizeText('About'),
            // ),
            //
            // ListTile(
            //   leading: Image.asset('assets/images/worker-image.jpeg');
            //   title: AutoSizeText('Feedback'),
            // ),
            // ListTile(
            //   leading: Image.asset('assets/images/worker-image.jpeg');
            //   title: AutoSizeText('Rate our app'),
            // ),
            // ListTile(
            //   leading: Image.asset('assets/images/worker-image.jpeg');
            //   title: AutoSizeText('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
