import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/BottomAppBar.dart';
import 'package:vimatone/Config/AppTheme.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Screens/Home/homeScreen.dart';

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
      home: Bottomappbar(
        pages: [
          // pages that should have bottom appbar
          HomeScreen()
        ],
      ),
    );
  }
}
