import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vimatone/Config/Extras.dart';

class LoginService {
  Future Login(String email, String password) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "login_form",
        "data": {"email": email, "password": password}
      },
    );

    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: apiHeaders,
      body: jsonEncode(reqBody),
    );
    if (response.statusCode == 200) {
      // print(response);
      return jsonDecode(response.body)["response"];
    } else {
      throw Exception();
    }
  }
}
