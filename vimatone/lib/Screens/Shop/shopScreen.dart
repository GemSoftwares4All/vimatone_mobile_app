import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Components/productCard.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Models/CategoryModel.dart';
import 'package:vimatone/Models/ProductsModel.dart';
import 'package:vimatone/Providers/CartProvider.dart';

class ShopScreen extends StatefulWidget {
  final Map<String, dynamic> product_filter;
  const ShopScreen({
    super.key,
    required this.product_filter,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<ProductsModel> sortedProductList = [];
  TextEditingController menucontroller = TextEditingController();
  ScrollController shop_scroll_controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.product_filter.containsKey("category")) {
      sortedProductList = ProductList.where(
        (product) {
          return product.category
              .toLowerCase()
              .contains(widget.product_filter["category"].toLowerCase());
        },
      ).toList();
      menucontroller.text = widget.product_filter["category"];
    } else
      sortedProductList = ProductList;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: Topappbar(
        title: "Shop",
        cartLength: cartProvider.cart.length,
      ),
      body: Column(
        children: [
          Container(
            color: color_primary,
            padding: EdgeInsets.all(padding_sm),
            child: Row(
              children: [
                DropdownMenu(
                  controller: menucontroller,
                  onSelected: (category) {
                    setState(() {
                      menucontroller.text = category!;
                      sortedProductList = ProductList.where(
                        (product) {
                          return product.category
                              .toLowerCase()
                              .contains(category.toLowerCase());
                        },
                      ).toList();
                    });
                  },
                  label: Text("Category"),
                  dropdownMenuEntries: List.generate(
                    categoryList.length,
                    (index) => DropdownMenuEntry(
                      value: categoryList[index].name,
                      label: categoryList[index].name,
                    ),
                  ),
                ),
                spaceWidth_md(),
                AppButton(
                    onTap: () async {
                      setState(() {
                        sortedProductList = ProductList;
                        menucontroller.value = TextEditingValue.empty;
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
          ),
          spaceHeight_sm(),
          Flexible(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                  top: padding_sm, left: padding_md, right: padding_md),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: padding_md,
                crossAxisSpacing: padding_md,
                childAspectRatio: 1 / 1.7,
                physics: AlwaysScrollableScrollPhysics(),
                controller: shop_scroll_controller,
                shrinkWrap: true,
                children: List.generate(
                  sortedProductList.length,
                  (index) {
                    return Productcard(
                      image: sortedProductList[index].thumbnail_id!,
                      title: sortedProductList[index].title,
                      price: "${sortedProductList[index].sale_price}",
                      priceStroke: sortedProductList[index].sale_price != 0
                          ? "${sortedProductList[index].regular_price}"
                          : null,
                      onCardTap: () {
                        Navigator.of(context).pushNamed(
                          "/view_product",
                          arguments: {
                            "index": index,
                          },
                        );
                      },
                      onAddTap: () {
                        setState(() {
                          cartProvider.addToCart(
                            sortedProductList[index],
                          );
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
