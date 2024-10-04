import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/widgets/CategoryCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Extras.padding_md,
            ),
            Padding(
              padding: EdgeInsets.all(Extras.padding_md),
              child: Text(
                "Category",
                style:
                    TextStyle(color: Extras.gray, fontSize: Extras.fontBody_md),
              ),
            ),
            Container(
              color: Extras.primary,
              padding: EdgeInsets.symmetric(vertical: Extras.padding_lg),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                    Categorycard(
                      image: "assets/images/default.jpg",
                      title: "Food",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
