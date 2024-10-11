import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Topappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showCartIcon;
  final int cartLength;
  final bool showSearch;
  final Widget? items;
  const Topappbar({
    super.key,
    required this.title,
    this.showCartIcon = true,
    this.showSearch = true,
    this.cartLength = 0,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [];

    if (showCartIcon) {
      _items.add(
        Row(
          children: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/cart");
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color_secondary,
                      shape: BoxShape.circle,
                    ),
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        "$cartLength",
                        style: font_tiny.copyWith(color: color_primary),
                      ),
                    ),
                  ),
                )
              ],
            ),
            spaceWidth_sm()
          ],
        ),
      );
    }

    if (showSearch)
      _items.add(
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/search");
          },
          icon: Icon(Icons.search),
        ),
      );

    _items.add(
      Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(right: padding_sm),
            child: items,
          );
        },
      ),
    );

    return AppBar(
      title: Text(title),
      actions: _items,
      centerTitle: true,
      scrolledUnderElevation: 0,
    );
  }

  static final _appbar = AppBar();

  @override
  Size get preferredSize => Topappbar._appbar.preferredSize;
}
