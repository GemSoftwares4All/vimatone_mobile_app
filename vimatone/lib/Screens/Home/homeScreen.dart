import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Screens/Home/widgets/categoryCard.dart';
import 'package:vimatone/Components/imageSlider.dart';
import 'package:vimatone/Screens/Home/widgets/productCard.dart';
import 'package:vimatone/Screens/Home/widgets/searchBar.dart';
import 'package:vimatone/Screens/ViewProduct/viewProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _ImagesFromDB = [
    "assets/images/ban1.jpg",
    "assets/images/ban2.jpg",
    "assets/images/ban3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    void categoryTapped() {
      // Extras.routeTo(context, ProductsPage());
      print("category_taped");
    }

    return SafeArea(
      child: Scaffold(
        appBar: Topappbar(
          title: "Home",
          showCartIcon: true,
          cartLength: cartProvider.cart.length,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceHeight_md(),
              Searchbar(),
              spaceHeight_md(),
              Imageslider(
                images: _ImagesFromDB,
                height: 200,
                viewPortFraction: 0.8,
                borderRadius: radius_md,
                onTap: (index) {
                  print(index);
                },
              ),
              spaceHeight_md(),
              Container(
                color: color_primary,
                padding: EdgeInsets.symmetric(vertical: padding_lg),
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
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
                height: padding_md,
              ),
              Container(
                color: color_primary,
                padding: EdgeInsets.all(padding_md),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending",
                          style: font_body,
                        ),
                        TextButton(
                          onPressed: () {
                            // goto products page
                          },
                          child: Text(
                            "More ...",
                            style: font_body.copyWith(color: color_secondary),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: color_background,
                      height: padding_md,
                    ),
                    Container(
                      // height: ,
                      child: GridView.count(
                        primary: false,
                        crossAxisCount: 2,
                        mainAxisSpacing: padding_md,
                        crossAxisSpacing: padding_md,
                        childAspectRatio: 1 / 1.85,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          productProvider.products.length,
                          (index) {
                            return Productcard(
                              image:
                                  productProvider.products[index].thumbnail_id!,
                              title: productProvider.products[index].title,
                              price:
                                  "${productProvider.products[index].sale_price}",
                              priceStroke: productProvider
                                          .products[index].sale_price !=
                                      0
                                  ? "${productProvider.products[index].regular_price}"
                                  : null,
                              onCardTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Viewproduct(product_index: index),
                                  ),
                                );
                              },
                              onAddTap: () {
                                setState(() {
                                  cartProvider.addToCart(
                                    productProvider.products[index],
                                  );
                                  // cartProvider.clearCart();
                                });
                              },
                            );
                          },
                        ),
                      ),
                    )
                    // treanding products displayed here
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
