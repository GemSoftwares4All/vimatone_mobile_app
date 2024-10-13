import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vimatone/Config/Extras.dart';

class AppNetworkImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const AppNetworkImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: height,
          width: width,
          child: SpinKitCircle(
            color: color_secondary,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          child: Icon(
            Icons.photo,
            color: color_gray,
            size: size_xlg,
          ),
          decoration: BoxDecoration(
            color: color_background,
            borderRadius: BorderRadius.circular(radius_md),
          ),
        );
      },
    );
  }
}
