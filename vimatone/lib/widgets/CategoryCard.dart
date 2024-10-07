import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

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
      margin: EdgeInsets.symmetric(horizontal: Extras.margin_sm),
      child: Material(
        borderRadius: BorderRadius.circular(Extras.radius_md),
        color: Extras.background,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Extras.padding_sm),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Extras.radius_md),
                  child: Image.asset(
                    image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Extras.tetiary,
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
