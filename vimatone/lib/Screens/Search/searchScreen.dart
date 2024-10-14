import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Screens/Home/widgets/searchBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color_primary,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  // ignore: prefer_const_constructors
                  Flexible(
                    flex: 2,
                    child: const Searchbar(),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(padding_md),
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: padding_sm),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius_md),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  // do search and restore results in products model file
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(padding_md),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.saved_search_rounded,
                                        color: color_gray,
                                      ),
                                      spaceWidth_lg(),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "Text djkfgdjfg djfv jdgf jdghfsjdfg sudfsjgd $index",
                                          style: font_body,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
