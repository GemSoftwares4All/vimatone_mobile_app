import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Models/CategoryModel.dart';
import 'package:vimatone/Models/ProductsModel.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/CategoryProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Screens/Home/widgets/categoryCard.dart';
import 'package:vimatone/Components/imageSlider.dart';
import 'package:vimatone/Components/productCard.dart';
import 'package:vimatone/Services/CategoryService.dart';
import 'package:vimatone/Services/ProductService.dart';

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
  final productService = ProductService();
  final categoryService = CategoryService();

  var _getCategory = CategoryService().getCategory();
  var _getTrending = ProductService().getTrending();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: Topappbar(
        title: "Home",
        cartLength: cartProvider.cart.length,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                child: categoryProvider.category.length > 0
                    ? Row(
                        children: List.generate(
                            categoryProvider.category.length, (index) {
                          var _catList = categoryProvider.category;
                          return Categorycard(
                            image: (baseUrl + _catList[index].image),
                            title: _catList[index].name,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                "/shop",
                                arguments: _catList[index].name,
                              );
                            },
                          );
                        }),
                      )
                    : FutureBuilder(
                        future: _getCategory,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Row(
                              children: List.generate(
                                3,
                                (index) => Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: padding_sm),
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(padding_sm),
                                    decoration: BoxDecoration(
                                        color: color_background,
                                        borderRadius:
                                            BorderRadius.circular(radius_md)),
                                  ),
                                  baseColor: color_background,
                                  highlightColor: color_primary,
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData) {
                            var _data = snapshot.data;
                            var _catdata = _data["data"];
                            return Row(
                              children: List.generate(
                                _catdata.length,
                                (index) {
                                  var _cat =
                                      CategoryModel.fromJson(_catdata[index]);
                                  categoryProvider.addCategory(_cat);
                                  return Categorycard(
                                    image: (baseUrl + _cat.image),
                                    title: _cat.name,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        "/shop",
                                        arguments: _cat.name,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }

                          if (snapshot.hasError) {
                            return Container(
                              height: 80,
                              padding: EdgeInsets.all(padding_md),
                              color: color_background,
                              width: MediaQuery.sizeOf(context).width,
                              child: Center(
                                child: Text(
                                  "Error!",
                                  style: font_body.copyWith(color: color_gray),
                                ),
                              ),
                            );
                          }

                          throw Exception();
                        },
                      ),
              ),
            ),
            spaceHeight_md(),
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
                          Navigator.of(context).pushNamed("/shop");
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
                  FutureBuilder(
                    future: _getTrending,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child: GridView.count(
                            primary: false,
                            crossAxisCount: 2,
                            mainAxisSpacing: padding_md,
                            crossAxisSpacing: padding_md,
                            childAspectRatio: 1 / 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                              4,
                              (index) => Shimmer.fromColors(
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: color_background,
                                        borderRadius:
                                            BorderRadius.circular(radius_md),
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
                              ),
                            ),
                          ),
                        );
                      }

                      if (snapshot.hasData) {
                        var _data = snapshot.data;
                        print(_data);
                        var _patdata = _data["data"];
                        return Container(
                          // height: ,
                          child: GridView.count(
                            primary: false,
                            crossAxisCount: 2,
                            mainAxisSpacing: padding_md,
                            crossAxisSpacing: padding_md,
                            childAspectRatio: 1 / 1.8,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                              _patdata.length,
                              (index) {
                                var _product =
                                    ProductsModel.fromJson(_patdata[index]);
                                productProvider.addProducts(_product);
                                return Productcard(
                                  image: (baseUrl +
                                      explodeImages(_product.thumbnail_id!)[0]),
                                  title: _product.title,
                                  price: "${_product.sale_price}",
                                  priceStroke: _product.sale_price != null
                                      ? "${_product.regular_price}"
                                      : null,
                                  onCardTap: () {
                                    Navigator.of(context).pushNamed(
                                      "/view_product",
                                      arguments: index,
                                    );
                                  },
                                  onAddTap: () {
                                    setState(() {
                                      cartProvider.addToCart(
                                        productProvider.products[index],
                                      );
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: color_success,
                                      content: Text(
                                        "Added successfully!",
                                        style: font_body.copyWith(
                                            color: color_dark),
                                      ),
                                    ));
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return Container(
                          height: 200,
                          padding: EdgeInsets.all(padding_md),
                          color: color_background,
                          width: MediaQuery.sizeOf(context).width,
                          child: Center(
                            child: Text(
                              "Error!",
                              style: font_title.copyWith(color: color_gray),
                            ),
                          ),
                        );
                      }

                      throw Exception();
                    },
                  ),
                  // treanding products displayed here
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
