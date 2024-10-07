import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Pages/Products.dart';
import 'package:vimatone/widgets/BannerCarousel.dart';
import 'package:vimatone/widgets/CategoryCard.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';
import 'package:vimatone/widgets/ProductCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _ImagesFromDB = [
    "assets/images/ban1.jpg",
    "assets/images/ban2.jpg",
    "assets/images/ban3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    void categoryTapped() {
      Extras.routeTo(context, ProductsPage());
    }

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Home",
          showCartIcon: true,
          cartLength: 20,
          showSearchIcon: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bannercarousel(
                images: _ImagesFromDB,
                onTap: (index) {
                  print(index);
                },
              ),
              SizedBox(
                height: Extras.margin_md,
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
                        width: Extras.padding_sm,
                      ),
                      Categorycard(
                        image: "assets/images/cat1.jpg",
                        title: "Pets",
                        onTap: categoryTapped,
                      ),
                      Categorycard(
                        image: "assets/images/cat2.jpg",
                        title: "Tools",
                        onTap: categoryTapped,
                      ),
                      Categorycard(
                        image: "assets/images/cat3.jpg",
                        title: "Groceries",
                        onTap: categoryTapped,
                      ),
                      Categorycard(
                        image: "assets/images/cat4.jpg",
                        title: "Computers",
                        onTap: categoryTapped,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Extras.margin_md,
              ),
              Container(
                color: Extras.primary,
                padding: EdgeInsets.all(Extras.padding_md),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending",
                          style: TextStyle(
                              color: Extras.text, fontSize: Extras.fontBody_md),
                        ),
                        TextButton(
                          onPressed: () {
                            Extras.routeTo(context, ProductsPage());
                          },
                          child: Text(
                            "More ...",
                            style: TextStyle(
                                color: Extras.secondary,
                                fontSize: Extras.fontBody_sm),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Extras.background,
                      height: Extras.padding_md,
                    ),

                    // treanding products displayed here
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: Extras.margin_lg,
                      spacing: Extras.margin_lg,
                      children: [
                        Productcard(
                          image: "assets/images/iphone.jpg",
                          title: "Iphone 14 pro max 4gbram 128gb rom",
                          price: "500.00",
                          onCardTap: () {},
                          onAddTap: () {},
                          onSaveTap: () {},
                        ),
                        Productcard(
                          image: "assets/images/mouse.jpg",
                          title: "Tytan's Gaming Mouse",
                          price: "48.99",
                          priceStroke: "90.32",
                          isSaved: true,
                          onCardTap: () {},
                          onAddTap: () {},
                          onSaveTap: () {},
                        ),
                        Productcard(
                          image: "assets/images/lap1.jpg",
                          title: "Lenovo Gaming Laptop",
                          price: "200.95",
                          priceStroke: "900.00",
                          onCardTap: () {},
                          onAddTap: () {},
                          onSaveTap: () {},
                        ),
                        Productcard(
                          image: "assets/images/lap2.jpg",
                          title: "AlienWare i9 32 cores 128gb ram",
                          price: "800.95",
                          priceStroke: "900.00",
                          onCardTap: () {},
                          onAddTap: () {},
                          onSaveTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
