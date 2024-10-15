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

  // Rafik's code
  Future vendorProducts(String postAuthor, String email) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "vendor",
        "data": {
          "post_author": postAuthor,
          "email": email,
          "for": "products",
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

  Future vendorOrders(String postAuthor, String email) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "vendor",
        "data": {
          "post_author": postAuthor,
          "email": email,
          "for": "orders",
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

  Future vendorWithdrawals(String postAuthor, String email) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "vendor",
        "data": {
          "post_author": postAuthor,
          "email": email,
          "for": "withdrawals",
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
