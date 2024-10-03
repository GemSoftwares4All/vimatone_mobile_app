import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(
            "TytanNet",
            style: TextStyle(
              color: Extras.tetiary,
              fontSize: Extras.fontTitle_md,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Extras.primary,
          currentIndex: 1,
          elevation: 10,
          selectedItemColor: Extras.secondary,
          selectedIconTheme: IconThemeData(
            size: Extras.fontTitle_md,
            fill: 1,
          ),
          unselectedIconTheme: IconThemeData(
            size: Extras.fontBody_md,
          ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_rounded),
              activeIcon: Icon(Icons.shopping_cart),
              label: "Cart",
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
