import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

class ProductsBottomNavigationBar extends StatefulWidget {
  const ProductsBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ProductsBottomNavigationBar> createState() => _ProductsBottomNavigationBarState();
}

class _ProductsBottomNavigationBarState extends State<ProductsBottomNavigationBar> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ProductsHomeScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school,),
            label: 'School',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,),
            label: 'Settings',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}



