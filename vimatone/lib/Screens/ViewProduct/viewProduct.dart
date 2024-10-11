import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Components/imageSlider.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Models/ProductsModel.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';

class Viewproduct extends StatefulWidget {
  final int product_index;
  const Viewproduct({
    super.key,
    required this.product_index,
  });

  @override
  State<Viewproduct> createState() => _ViewproductState();
}

class _ViewproductState extends State<Viewproduct> {
  @override
  Widget build(BuildContext context) {
    final prdProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final ProductsModel productToView =
        prdProvider.products[widget.product_index];
    return Scaffold(
      appBar: Topappbar(
        title: "Product",
        showCartIcon: true,
        cartLength: cartProvider.cart.length,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Imageslider(
              images: [productToView.thumbnail_id!],
              onTap: (index) {},
              height: 300,
              expandCenter: false,
            ),
            spaceHeight_md(),
            Container(
              padding: EdgeInsets.all(padding_md),
              width: double.infinity,
              color: color_primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details",
                    style: font_subtitle,
                  ),
                  Divider(
                    thickness: 1,
                    color: color_gray,
                  ),
                  Text(
                    productToView.title,
                    style: font_subtitle,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "$currency ${productToView.regular_price}",
                          style: font_body.copyWith(
                            color: color_gray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: color_gray,
                          ),
                        ),
                      ),
                      spaceWidth_lg(),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "$currency ${productToView.sale_price}",
                          style: font_subtitle.copyWith(color: color_secondary),
                        ),
                      ),
                    ],
                  ),
                  spaceHeight_md(),
                  Text(
                    "Description",
                    style: font_subtitle,
                  ),
                  Divider(
                    thickness: 1,
                    color: color_gray,
                  ),
                  Text(
                    productToView.description!,
                    style: font_body,
                  ),
                  spaceHeight_lg(),
                  Container(
                    padding: EdgeInsets.all(padding_sm),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color_background,
                      borderRadius: BorderRadius.circular(radius_md),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                cartProvider.addToCart(productToView);
                                // cartProvider.clearCart();
                              });
                            },
                            style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.all(padding_md)),
                                backgroundColor:
                                    WidgetStatePropertyAll(color_secondary),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(radius_md),
                                  ),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Add to Cart",
                                  style:
                                      font_body.copyWith(color: color_primary),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: color_primary,
                                  size: size_md,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook_rounded,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.link,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
