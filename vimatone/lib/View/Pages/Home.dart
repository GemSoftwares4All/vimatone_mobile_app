import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/widgets/BannerCarousel.dart';
import 'package:vimatone/widgets/CategoryCard.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _ImagesFromDB = [
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
    "assets/images/default.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Home",
          showCartIcon: true,
          cartLength: 20,
          showSearchIcon: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bannercarousel(
              images: _ImagesFromDB,
              onTap: (index) {
                print(index);
              },
            ),
            SizedBox(
              height: Extras.padding_md,
            ),
            Container(
              color: Extras.primary,
              padding: EdgeInsets.symmetric(vertical: Extras.padding_lg),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
