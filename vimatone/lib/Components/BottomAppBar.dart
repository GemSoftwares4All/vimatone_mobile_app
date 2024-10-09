import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Bottomappbar extends StatefulWidget {
  final List<Widget> pages;
  const Bottomappbar({
    super.key,
    required this.pages,
  });

  @override
  State<Bottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
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
        children: widget.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: color_primary,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: color_secondary,
          selectedIconTheme: IconThemeData(
            size: size_lg,
          ),
          unselectedIconTheme: IconThemeData(
            size: size_lg,
          ),
          onTap: _onItemTap,
          showUnselectedLabels: true,
          unselectedItemColor: color_gray,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              activeIcon: Icon(Icons.shopping_basket_rounded),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Account",
            )
          ]),
    );
  }
}
