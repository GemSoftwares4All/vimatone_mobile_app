import 'dart:convert'; // For encoding/decoding JSON
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Save full user info as JSON
  static Future<void> saveLoginInfo(Map<String, dynamic> userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    String userJson = jsonEncode(userInfo); // Convert the userInfo map to a JSON string
    await prefs.setString('userInfo', userJson); // Save the JSON string
    await prefs.setBool('isLoggedIn', true); // Set login status
  }

  // Retrieve user info as a Map
  static Future<Map<String, dynamic>?> getUserInfo() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    String? userJson = prefs.getString('userInfo'); // Get the JSON string
    if (userJson != null) {
      return jsonDecode(userJson); // Convert the JSON string back to a Map
    }
    return null;
  }

  // Clear login info
  static Future<void> clearLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all user info
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
