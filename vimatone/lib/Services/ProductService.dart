import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vimatone/Config/Extras.dart';

class ProductService {
  Future getTrending() async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "fetch_ads",
        "data": {
          "for": "trending",
          "limit": 16,
        },
      },
    );

    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: apiHeaders,
      body: jsonEncode(reqBody),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["response"];
    } else {
      throw Exception();
    }
  }

  Future getByCategory(String category) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "fetch_ads",
        "data": {
          "for": "trending",
          "limit": 20,
          "by_category": category,
        },
      },
    );

    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: apiHeaders,
      body: jsonEncode(reqBody),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["response"];
    } else {
      throw Exception();
    }
  }

  Future getProducts() async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "fetch_ads",
        "data": {
          "for": "trending",
          "limit": 20,
        },
      },
    );

    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: apiHeaders,
      body: jsonEncode(reqBody),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["response"];
    } else {
      throw Exception();
    }
  }
}
