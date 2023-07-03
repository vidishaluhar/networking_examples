import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:networking_examples/model/http_model.dart';
import 'package:http/http.dart' as http;

class HttpService {

  /// Http Get Request Example
  static Future<List<HttpModel>> fetchDataFromHttpApi() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/albums/");
    try {
      final response = await http.get(url);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        final httpData = jsonDecode(response.body) as List;
        return httpData
            .map(
              (e) => HttpModel.fromJson(e),
        )
            .toList();
      } else {
        debugPrint("Failed to Fetch data");
        return [];
      }
    } catch (e) {
      debugPrint("Error while fetching data from Api : $e");
      return [];
    }
  }

  /// Http Post Request Example
  static Future<HttpModel> sendData() async {
    final http.Response response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/"),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(HttpModel(
          title: 'Vidisha',
          userId: 11,
        )
          ..toJson()));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return HttpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Data loading failed ");
    }
  }

  /// Http Put Request Example
  static Future<HttpModel> updateMapData() async {
    final http.Response response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        HttpModel(
          userId: 1,
          title: 'Priyanshi',
        ).toJson(),
      ),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return HttpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Data Updating failed ");
    }
  }


  /// Http Patch Request Example
  static Future<HttpModel> updateItemOfMapData() async {
    final http.Response response = await http.patch(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        HttpModel(
          userId: 1,
          title: 'Radhika',
        ).toJson(),
      ),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return HttpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Patch Request Failed ");
    }
  }

  /// Http Delete Request Example
  static Future<HttpModel> deleteMapData() async {
    final http.Response response = await http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return HttpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to Delete Data");
    }
  }
}
