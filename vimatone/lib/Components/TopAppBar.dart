import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Topappbar extends StatefulWidget implements PreferredSizeWidget {
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
  State<Topappbar> createState() => _TopappbarState();

  static final _appbar = AppBar();
  @override
  Size get preferredSize => _appbar.preferredSize;
}

class _TopappbarState extends State<Topappbar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (widget.showCartIcon) {
      items.add(
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/cart");
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(padding_md),
                    child: const Icon(Icons.shopping_cart_outlined),
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
                          "${widget.cartLength}",
                          style: font_tiny.copyWith(color: color_primary),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            spaceWidth_sm()
          ],
        ),
      );
    }

    if (widget.showSearch)
      items.add(
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/search");
          },
          icon: Icon(Icons.search),
        ),
      );

    items.add(
      Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(right: padding_sm),
            child: widget.items,
          );
        },
      ),
    );

    return AppBar(
      title: Text(widget.title),
      actions: items,
      centerTitle: true,
      scrolledUnderElevation: 0,
    );
  }
}
