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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Extras.margin_sm),
        padding: EdgeInsets.all(Extras.padding_sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Extras.radius_md),
          color: Extras.background,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
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
    );
  }
}
