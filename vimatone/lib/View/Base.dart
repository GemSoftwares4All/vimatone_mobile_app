import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Pages/Home.dart';
import 'package:vimatone/View/Pages/Orders.dart';
import 'package:vimatone/View/Pages/Products.dart';
import 'package:vimatone/View/Pages/Profile.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  // bottom nav tap
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          ProductsPage(),
          OrdersPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Extras.primary,
          currentIndex: _selectedIndex,
          selectedItemColor: Extras.secondary,
          selectedIconTheme: IconThemeData(
            size: Extras.fontTitle_sm,
          ),
          unselectedIconTheme: IconThemeData(
            size: Extras.fontBody_md,
          ),
          onTap: _onItemTap,
          showUnselectedLabels: true,
          unselectedItemColor: Extras.gray,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.other_houses_outlined),
              activeIcon: Icon(Icons.other_houses),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              activeIcon: Icon(Icons.shopping_basket),
              label: "Products",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.add_shopping_cart_rounded),
            //   activeIcon: Icon(Icons.shopping_cart),
            //   label: "Cart",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_outlined),
              activeIcon: Icon(Icons.local_shipping),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Profile",
            )
          ]),
    );
  }
}
