import 'package:flutter/material.dart';
import 'package:vensemart/products/screens/CartScreen.dart';
import 'package:vensemart/products/screens/ProductsOffersScreen.dart';
import 'package:vensemart/products/screens/ProductsOrderListScreen.dart';
import 'package:vensemart/products/screens/ProductsProfileScreen.dart';
import 'package:vensemart/products/widgets/AppBars/ProductsHomeAppBar.dart';
import 'package:vensemart/products/widgets/AppBars/ProductsOfferAppBar.dart';
import 'package:vensemart/products/widgets/AppBars/ProductsOrderListAppBar.dart';
import 'package:vensemart/products/widgets/AppBars/ProductsProfileAppBar.dart';
import 'package:vensemart/products/widgets/Drawers/ProductsDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../widgets/AppBars/ProductsCartAppBar.dart';
import '../widgets/full_pages/ProductsHome.dart';
import 'SubscriptionList.dart';



class ProductsHomeScreen extends StatelessWidget {
  const ProductsHomeScreen({super.key});
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
    ProductsHome(),
     ProductOrderListScreen(),
     CartScreen(),
    ProductsOffersScreen(),
    ProductsProfile(),
  ];

  static final List<Widget> _appBars = [
    const ProductsHomeAppBar(),
    const ProductsOrderListAppBar(),
    const ProductsCartAppBar(),
    const ProductsOfferAppBar(),
    const ProductsProfileAppBar(),
  ];

  static final List<Widget> _drawers = [
    const ProductsDrawer(),
    const ProductsDrawer(),
    const ProductsDrawer(),
    const ProductsDrawer(),
    const ProductsDrawer(),
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
            icon: FaIcon(Icons.view_list_outlined),
            label: 'Orderlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.wallet_giftcard_rounded),
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
