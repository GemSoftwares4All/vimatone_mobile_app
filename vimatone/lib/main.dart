import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/BottomAppBar.dart';
import 'package:vimatone/Config/AppTheme.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/CategoryProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Providers/UserProvider.dart';
import 'package:vimatone/Screens/Account/Login/loginScreen.dart';
import 'package:vimatone/Screens/Account/accountBase.dart';
import 'package:vimatone/Screens/Cart/cartScreen.dart';
import 'package:vimatone/Screens/Home/homeScreen.dart';
import 'package:vimatone/Screens/Loading/loadingScreen.dart';
import 'package:vimatone/Screens/Search/searchScreen.dart';
import 'package:vimatone/Screens/Shop/shopScreen.dart';
import 'package:vimatone/Screens/ViewProduct/viewProduct.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const Vimatone(),
    ),
  );
}

class Vimatone extends StatefulWidget {
  const Vimatone({super.key});

  @override
  State<Vimatone> createState() => _VimatoneState();
}

class _VimatoneState extends State<Vimatone> {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // get and set categories
    return MaterialApp(
      title: 'Vimatone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light_theme,
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingScreen(),
        "/home": (context) => Bottomappbar(
              pages: [
                HomeScreen(),
                ShopScreen(),
                Accountbase(),
              ],
            ),
        "/cart": (context) => CartScreen(),
        "/search": (context) => SearchScreen(),
        "/login": (context) => LoginScreen(),
        "/shop": (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return ShopScreen(category: args);
        },
        "/view_product": (context) {
          final args = ModalRoute.of(context)!.settings.arguments as int;
          return Viewproduct(product_index: args);
        }
      },
    );
  }
}
