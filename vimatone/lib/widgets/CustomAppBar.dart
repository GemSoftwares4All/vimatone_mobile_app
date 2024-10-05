import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Pages/Cart.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchIcon;
  final bool showCartIcon;
  final int cartLength;
  final Widget? items;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showCartIcon = false,
    this.cartLength = 0,
    this.showSearchIcon = false,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [];
    if (showSearchIcon) {
      _items.add(
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded),
            ),
            SizedBox(
              width: Extras.fontBody_sm,
            ),
          ],
        ),
      );
    }

    if (showCartIcon) {
      _items.add(
        Row(
          children: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Extras.routeTo(context, CartPage());
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Extras.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 18,
                    height: 18,
                    child: Center(
                      child: Text(
                        "$cartLength",
                        style: TextStyle(
                          fontSize: Extras.fontBody_xsm,
                          color: Extras.primary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: Extras.fontBody_sm,
            )
          ],
        ),
      );
    }

    _items.add(
      Builder(
        builder: (context) {
          return SizedBox(
            child: items,
          );
          // if (items != null) {
          // } else {
          //   return SizedBox();
          // }
        },
      ),
    );

    return AppBar(
      title: Text(title),
      actions: _items,
      centerTitle: true,
    );
  }

  static final _appbar = AppBar();

  @override
  Size get preferredSize => CustomAppBar._appbar.preferredSize;
}
