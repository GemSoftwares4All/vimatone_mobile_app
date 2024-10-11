import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/BottomAppBar.dart';
import 'package:vimatone/Config/AppTheme.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Screens/Cart/cartScreen.dart';
import 'package:vimatone/Screens/Home/homeScreen.dart';
import 'package:vimatone/Screens/Search/searchScreen.dart';
import 'package:vimatone/Screens/Shop/shopScreen.dart';
import 'package:vimatone/Screens/ViewProduct/viewProduct.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const Vimatone(),
    ),
  );
}

class Vimatone extends StatelessWidget {
  const Vimatone({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vimatone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light_theme,
      initialRoute: "/",
      routes: {
        "/": (context) => Bottomappbar(
              pages: [HomeScreen(), ShopScreen(product_filter: {})],
            ),
        "/cart": (context) => CartScreen(),
        "/search": (context) => SearchScreen(),
        "/shop": (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ShopScreen(
            product_filter: args,
          );
        },
        "/view_product": (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, int>;
          return Viewproduct(
            product_index: args["index"]!,
          );
        }
      },
    );
  }
}
