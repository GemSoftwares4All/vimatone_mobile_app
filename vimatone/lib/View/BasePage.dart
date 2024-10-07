import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Pages/Category.dart';
import 'package:vimatone/View/Pages/Home.dart';
import 'package:vimatone/View/Pages/Orders.dart';
import 'package:vimatone/View/Pages/Profile.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
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
          CategoryPage(),
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
              icon: Icon(Icons.dashboard_customize_outlined),
              activeIcon: Icon(Icons.dashboard_customize),
              label: "Category",
            ),
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
