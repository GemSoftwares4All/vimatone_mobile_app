import 'package:flutter/material.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        showCartIcon: true,
        cartLength: 20,
      ),
      body: Center(
        child: Text("ProfilePage"),
      ),
    );
  }
}
