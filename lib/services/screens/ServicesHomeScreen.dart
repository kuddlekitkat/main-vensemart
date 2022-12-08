import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/ServicesAppoinmentScreen.dart';
import 'package:vensemart/services/screens/ServicesOffersScreen.dart';
import 'package:vensemart/services/screens/ServicesProfileScreen.dart';
import 'package:vensemart/services/widgets/AppBars/ServicesAppointmentAppBar.dart';
import 'package:vensemart/services/widgets/AppBars/ServicesHomeAppBar.dart';
import 'package:vensemart/services/widgets/AppBars/ServicesOffersAppBar.dart';
import 'package:vensemart/services/widgets/AppBars/ServicesProfileAppBar.dart';
import 'package:vensemart/services/widgets/Drawers/ServicesDrawer.dart';
import 'package:vensemart/services/widgets/full_pages/ServiceHome.dart';



class ServicesHomeScreen extends StatelessWidget {
  const ServicesHomeScreen({super.key});
  static const routeName = '/home';
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ServiceHome(),
    ServicesAppointmentScreen(),
    ServicesOffersScreen(),
    ServicesProfileScreen(),
  ];

  static final List<Widget> _appBars = [
    const ServicesHomeAppBar(),
    const ServicesAppointmentAppBar(),
    const ServicesOffersAppBar(),
    const ServicesProfileAppBar(),
  ];

  static final List<Widget> _drawers = [
    const ServicesDrawer(),
    const ServicesDrawer(),
    const ServicesDrawer(),
    const ServicesDrawer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // 56 is default height
        child: _appBars[_selectedIndex],
      ),
      drawer: PreferredSize(
        preferredSize: const Size.fromHeight(56), // 56 is default height
        child: _drawers[_selectedIndex],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard_rounded),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
