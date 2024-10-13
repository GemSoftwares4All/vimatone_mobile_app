import 'package:flutter/material.dart';
import 'package:vimatone/Services/CategoryService.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = CategoryService();
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          var data = await categoryService.getCategory();
          print(data);
        },
        child: Text("click here!"),
      ),
    );
  }
}
