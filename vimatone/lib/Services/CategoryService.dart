import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vimatone/Config/Extras.dart';

class CategoryService {
  Future getCategory() async {
    var reqBody = apiBody;
    reqBody.addAll(
      {"endpoint": "categories"},
    );

    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: apiHeaders,
      body: jsonEncode(reqBody),
    );
    if (response.statusCode == 200) {
      print(response);
      return jsonDecode(response.body)["response"];
    } else {
      throw Exception();
    }
  }
}
