import 'package:flutter/material.dart';
import 'package:vimatone/Components/AppNetworkImage.dart';
import 'package:vimatone/Config/Extras.dart';

class Categorycard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const Categorycard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding_sm),
      child: Material(
        borderRadius: BorderRadius.circular(radius_md),
        color: color_background,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(padding_md),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius_md),
                  child: AppNetworkImage(
                    image: image,
                    width: 80,
                    height: 80,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: color_tetiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
