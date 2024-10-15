import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Data/LocalStorage.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Providers/CategoryProvider.dart';
import 'package:vimatone/Services/CategoryService.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    // check login status and set auth provider
    final authProvider = Provider.of<AuthProvider>(context);
    // LocalStorage().getAuthorized().then((loginStatus) {
    //   // set auth provider to either authorized or not
    //   // if previously authorized will set true else false
    //   authProvider.setAuth(loginStatus);
    // });

    // set categories into provider
    final categoryProvider = Provider.of<CategoryProvider>(context);
    CategoryService().getCategory().then((_catList) {
      List _cdata = _catList["data"];
      categoryProvider.addCategories(_cdata);
    });

    // now redirect to home
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (_) => false);
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 100,
                height: 100,
              ),
              SpinKitWave(
                color: color_secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
