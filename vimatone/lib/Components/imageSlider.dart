import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Imageslider extends StatefulWidget {
  final List<String> images;
  final double? viewPortFraction;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? height;
  final bool expandCenter;
  final Function(int) onTap;
  const Imageslider({
    super.key,
    required this.images,
    required this.onTap,
    this.viewPortFraction = 1.0,
    this.height,
    this.padding,
    this.borderRadius,
    this.expandCenter = true,
  });

  @override
  State<Imageslider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<Imageslider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _imagesLength = widget.images.length;
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: _imagesLength,
          itemBuilder: (context, int index, int realIndex) {
            return GestureDetector(
              onTap: () {
                widget.onTap(index);
              },
              child: ClipRRect(
                borderRadius: widget.borderRadius == null
                    ? BorderRadius.zero
                    : BorderRadius.circular(widget.borderRadius!),
                child: Hero(
                  tag: widget.images[index],
                  child: Image.asset(
                    widget.images[index],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: widget.viewPortFraction!,
            enableInfiniteScroll: widget.images.length > 1 ? true : false,
            enlargeCenterPage:
                widget.images.length > 1 ? widget.expandCenter : false,
            enlargeFactor: 0.15,
            autoPlay: true,
            onPageChanged: (changeIndex, reason) {
              setState(() {
                _currentIndex = changeIndex;
              });
            },
          ),
        ),
        if (widget.images.length > 1)
          Positioned(
            left: 0,
            bottom: padding_sm,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(_imagesLength, (idx) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _currentIndex == idx ? 16 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: padding_sm),
                  decoration: BoxDecoration(
                      color:
                          _currentIndex == idx ? color_secondary : color_gray,
                      borderRadius: BorderRadius.circular(radius_sm)),
                );
              }),
            ),
          )
      ],
    );
  }
}
