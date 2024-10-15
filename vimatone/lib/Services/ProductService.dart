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

    try {
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
    } catch (e) {}
  }

  Future getByCategory(String category) async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "fetch_ads",
        "data": {
          "for": "promo_ads",
          "limit": 20,
          "by_category": category,
        },
      },
    );

    try {
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
    } catch (e) {}
  }

  Future getProducts() async {
    var reqBody = apiBody;
    reqBody.addAll(
      {
        "endpoint": "fetch_ads",
        "data": {
          "for": "promo_ads",
          "limit": 20,
        },
      },
    );

    try {
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
    } catch (e) {}
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

    try {
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
    } catch (e) {}
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

    try {
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
    } catch (e) {}
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

    try {
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
    } catch (e) {}
  }
}
