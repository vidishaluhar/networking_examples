import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/dio_model.dart';


class DioService {

  static final Dio dio = Dio();
  ///Dio Get Request Example
  static Future<List<DioModel>> fetchData() async {
    List<DioModel> dioModal= [];
    const url = 'https://jsonplaceholder.typicode.com/albums/';
    try {
      final response = await dio.get(url);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        print("API call successful");
        print("Response Data : ${(response.data).map((e) => DioModel.fromJson(e))}");
       final data = response.data;
       for(var i in data){
         dioModal.add(DioModel.fromJson(i));
       }
       return dioModal;
      } else {
        print("API call failed with status code : ${response.statusCode}");
        print("Error Message : ${response.data}");
        return [];
      }
    } catch (e) {
      print("API call failed with Error : $e");
      return [];
    }
  }

  ///Dio Post Request Example
  static Future<List<DioModel>> postData() async {
    List<DioModel> dioModal= [];
    const url = 'https://jsonplaceholder.typicode.com/albums/';
    final Dio dio = Dio();
    try {
      final response = await dio.get(url);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        print("API call successful");
        print("Response Data : ${(response.data).map((e) => DioModel.fromJson(e))}");
        final data = response.data;
        for(var i in data){
          dioModal.add(DioModel.fromJson(i));
        }
        return dioModal;
      } else {
        print("API call failed with status code : ${response.statusCode}");
        print("Error Message : ${response.data}");
        return [];
      }
    } catch (e) {
      print("API call failed with Error : $e");
      return [];
    }
  }

}
