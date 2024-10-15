import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vimatone/Config/Extras.dart';

class ProductCardShimmer extends StatefulWidget {
  const ProductCardShimmer({super.key});

  @override
  State<ProductCardShimmer> createState() => _ProductCardShimmerState();
}

class _ProductCardShimmerState extends State<ProductCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: color_background,
              borderRadius: BorderRadius.circular(radius_md),
            ),
          ),
          spaceHeight_sm(),
          Container(
            width: double.infinity,
            height: 15,
            decoration: BoxDecoration(
              color: color_background,
              borderRadius: BorderRadius.circular(
                radius_md,
              ),
            ),
          ),
          spaceHeight_sm(),
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: color_background,
              borderRadius: BorderRadius.circular(
                radius_md,
              ),
            ),
          ),
          spaceHeight_sm(),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: color_background,
              borderRadius: BorderRadius.circular(
                radius_md,
              ),
            ),
          ),
        ],
      ),
      baseColor: color_background,
      highlightColor: color_primary,
    );
  }
}
