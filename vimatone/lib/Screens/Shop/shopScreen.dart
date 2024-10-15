import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Components/productCard.dart';
import 'package:vimatone/Components/productCardShimmer.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Models/ProductsModel.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/CategoryProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Services/ProductService.dart';

class ShopScreen extends StatefulWidget {
  final String? category;
  const ShopScreen({
    super.key,
    this.category = "",
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController menucontroller = TextEditingController();
  ScrollController shop_scroll_controller = ScrollController();
  var _getProducts = ProductService().getProducts();

  @override
  void initState() {
    super.initState();
    if (widget.category != "") {
      menucontroller.text = widget.category != "" ? widget.category! : "";
      _getProducts = ProductService().getByCategory(widget.category!);
    }
    // check is categoryProvider is empty then fill it

    // was having some error, is not that important as
    // the user will goto home first and categories
    // will be loaded from there first

    // final _categoryProvider = Provider.of<CategoryProvider>(context);
    // final _categoryService = CategoryService();
    // if (_categoryProvider.category.length == 0) {
    //   _categoryService.getCategory().then(
    //     (_data) {
    //       var _catdata = _data["data"];
    //       for (var _cat in _catdata) {
    //         _categoryProvider.addCategory(CategoryModel.fromJson(_cat));
    //       }
    //     },
    //   );
    // }
  }

  // ? ProductService().getByCategory(widget.product_filter["category"])
  // : ProductService().getProducts();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: Topappbar(
        title: "Shop",
        cartLength: cartProvider.cart.length,
      ),
      body: Container(
        padding: EdgeInsets.all(padding_md),
        color: color_primary,
        margin: EdgeInsets.only(top: padding_sm),
        child: Column(
          children: [
            Row(
              children: [
                DropdownMenu(
                  width: MediaQuery.sizeOf(context).width / 1.7,
                  controller: menucontroller,
                  menuHeight: MediaQuery.sizeOf(context).width,
                  onSelected: (category) {
                    setState(() {
                      menucontroller.text = category!;
                      _getProducts = ProductService().getByCategory(category);
                    });
                  },
                  label: Text("Category"),
                  dropdownMenuEntries: List.generate(
                    categoryProvider.category.length,
                    (index) => DropdownMenuEntry(
                      value: categoryProvider.category[index].name,
                      label: categoryProvider.category[index].name,
                    ),
                  ),
                ),
                spaceWidth_md(),
                AppButton(
                    onTap: () async {
                      setState(() {
                        menucontroller.value = TextEditingValue.empty;
                        _getProducts = ProductService().getProducts();
                      });
                    },
                    items: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Icon(
                          Icons.cancel_outlined,
                          color: color_primary,
                        ),
                      )
                    ])
              ],
            ),
            spaceHeight_sm(),
            Flexible(
              flex: 4,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: _getProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: GridView.count(
                          primary: false,
                          crossAxisCount: 2,
                          mainAxisSpacing: padding_md,
                          crossAxisSpacing: padding_md,
                          childAspectRatio: 1 / 1.8,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                            4,
                            (index) => ProductCardShimmer(),
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasData) {
                      var _data = snapshot.data;
                      var _patdata = _data["data"];
                      return Container(
                        // height: ,
                        child: GridView.count(
                          primary: false,
                          crossAxisCount: 2,
                          // mainAxisSpacing: padding_md,
                          crossAxisSpacing: padding_md,
                          childAspectRatio: 1 / 2,
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
                                    arguments: _product,
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
                                      style:
                                          font_body.copyWith(color: color_dark),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
