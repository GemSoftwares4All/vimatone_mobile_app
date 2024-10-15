// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Models/ProductsModel.dart';
import 'package:vimatone/Providers/ProductProvider.dart';
import 'package:vimatone/Providers/UserProvider.dart';
import 'package:vimatone/Screens/Account/Accounts/widgets/productsTile.dart';
import 'package:vimatone/Services/ProductService.dart';

class Accountscreen extends StatefulWidget {
  const Accountscreen({super.key});

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool loggedIn = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // _checkLoginStatus();

    // if (loggedIn) {
    //   _fetchData();
    // }
  }

  // Future<void> _fetchData() async {
  //   try {
  //     Map<String, dynamic>? c_user = await UserPreferences.getUserInfo();

  //     if (c_user != null) {
  //       email = c_user["email"];
  //       post_author = c_user["post_author"];

  //       var _getVProducts =
  //           await ProductService().vendorProducts(post_author, email);
  //       var _getVOrders =
  //           await ProductService().vendorOrders(post_author, email);
  //       var _getVWithdrawals =
  //           await ProductService().vendorWithdrawals(post_author, email);

  //       // if(_getVProducts["status"] == 200 && _getVProducts["data"].length != 0) {

  //       // }

  //       // if(_getVOrders["status"] == 200 && _getVOrders["data"].length != 0 ){

  //       // }

  //       // if(_getVWithdrawals["status"] == 200 && _getVWithdrawals["data"].length != 0 ){

  //       // }
  //     }
  //   } catch (e) {
  //     print("Error");
  //   }
  // }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    var user = userProvider.CurrentUser;

    var _getVProducts = ProductService().vendorProducts(user.fname, user.email);
    var _getVOrders = ProductService().vendorOrders(user.fname, user.email);
    var _getVWithdrawals =
        ProductService().vendorWithdrawals(user.fname, user.email);

    return Scaffold(
      // appBar: Topappbar(
      //   title: "Account",
      // ),
      body: Container(
        color: color_primary,
        child: loggedIn
            ? ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(15),
                children: [
                  Container(
                    height: 280,
                    child: Container(
                      child: Column(),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 40,
                    child: TabBar(
                        controller: _tabController,
                        labelColor: color_secondary,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: color_secondary,
                        tabs: [
                          Tab(
                            text: "Products",
                          ),
                          Tab(
                            text: "Orders",
                          ),
                          Tab(
                            text: "Withdrawal",
                          ),
                        ]),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                      child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Content for each tab
                      Container(
                        child: Flexible(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: _getVProducts,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                        (index) => Shimmer.fromColors(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          radius_md),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          baseColor: color_background,
                                          highlightColor: color_primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                if (snapshot.hasData) {
                                  var _data = snapshot.data;
                                  print(_data);
                                  var _patdata = _data["data"];
                                  return Container(
                                    // height: ,
                                    child: GridView.count(
                                      primary: false,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: padding_md,
                                      crossAxisSpacing: padding_md,
                                      childAspectRatio: 1 / 1.8,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: List.generate(
                                        _patdata.length,
                                        (index) {
                                          var _product = ProductsModel.fromJson(
                                              _patdata[index]);
                                          productProvider.addProducts(_product);
                                          return ProductTile(
                                            image: (baseUrl +
                                                explodeImages(
                                                    _product.thumbnail_id!)[0]),
                                            title: _product.title,
                                            price: "${_product.sale_price}",
                                            priceStroke: _product.sale_price !=
                                                    null
                                                ? "${_product.regular_price}"
                                                : null,
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
                                        style: font_title.copyWith(
                                            color: color_gray),
                                      ),
                                    ),
                                  );
                                }

                                throw Exception();
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Flexible(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: _getVOrders,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                        (index) => Shimmer.fromColors(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          radius_md),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          baseColor: color_background,
                                          highlightColor: color_primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                if (snapshot.hasData) {
                                  var _data = snapshot.data;
                                  print(_data);
                                  var _patdata = _data["data"];
                                  return ListView(
                                      // height: ,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        DataTable(
                                          columns: [
                                            DataColumn(label: Text("Product")),
                                            DataColumn(label: Text("Amount")),
                                            DataColumn(label: Text("Status")),
                                            DataColumn(label: Text("On")),
                                          ],
                                          rows: _patdata.map((order) {
                                            return DataRow(cells: [
                                              DataCell(Text(order["products"])),
                                              DataCell(Text(
                                                  "¢${order['total_amount']}")),
                                              DataCell(
                                                  Text(order["order_status"])),
                                              DataCell(
                                                  Text(order["order_date"])),
                                            ]);
                                          }),
                                        )
                                      ]);
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
                                        style: font_title.copyWith(
                                            color: color_gray),
                                      ),
                                    ),
                                  );
                                }

                                throw Exception();
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Flexible(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: _getVWithdrawals,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                        (index) => Shimmer.fromColors(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          radius_md),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                              spaceHeight_sm(),
                                              Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: color_background,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    radius_md,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          baseColor: color_background,
                                          highlightColor: color_primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                if (snapshot.hasData) {
                                  var _data = snapshot.data;
                                  print(_data);
                                  var _patdata = _data["data"];
                                  return ListView(
                                      // height: ,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        DataTable(
                                          columns: [
                                            // DataColumn(label: Text("Product")),
                                            DataColumn(label: Text("Amount")),
                                            // DataColumn(label: Text("Status")),
                                            DataColumn(label: Text("On")),
                                          ],
                                          rows: _patdata.map((order) {
                                            return DataRow(cells: [
                                              // DataCell(Text(order["products"])),
                                              DataCell(Text(
                                                  "¢${order['total_amount']}")),
                                              // DataCell(Text(order["order_status"])),
                                              DataCell(
                                                  Text(order["order_date"])),
                                            ]);
                                          }),
                                        )
                                      ]);
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
                                        style: font_title.copyWith(
                                            color: color_gray),
                                      ),
                                    ),
                                  );
                                }

                                throw Exception();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),

                  // Expanded(
                  //   child: Text("Bottom Belt")
                  // )
                ],
              )
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      spaceHeight_lg(),
                      Text("Please Login First"),
                      ElevatedButton(
                          child: Text("Login Here"),
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          })
                    ]),
              ),
      ),
    );
  }
}
