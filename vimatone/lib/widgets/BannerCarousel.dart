import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Bannercarousel extends StatefulWidget {
  final List<String> images;
  final Function(int) onTap;
  const Bannercarousel({
    super.key,
    required this.images,
    required this.onTap,
  });

  @override
  State<Bannercarousel> createState() => _BannercarouselState();
}

class _BannercarouselState extends State<Bannercarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _imagesLength = widget.images.length;
    return Container(
      color: Extras.primary,
      padding: EdgeInsets.symmetric(vertical: Extras.padding_lg),
      width: double.infinity,
      height: 270,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: _imagesLength,
            itemBuilder: (context, int index, int realIndex) {
              return GestureDetector(
                onTap: () {
                  widget.onTap(index);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    widget.images[index],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (changeIndex, reason) {
                setState(() {
                  _currentIndex = changeIndex;
                });
              },
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(_imagesLength, (idx) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.only(left: Extras.margin_xsm),
                decoration: BoxDecoration(
                  color: _currentIndex == idx ? Extras.secondary : Extras.gray,
                  shape: BoxShape.circle,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
