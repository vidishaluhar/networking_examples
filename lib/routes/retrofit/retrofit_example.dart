import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/main.dart';
import 'package:networking_examples/model/retrofit_model.dart';
import 'package:networking_examples/services/retrofit_services.dart';

class RetrofitExample extends StatelessWidget {
  RetrofitExample({super.key});



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomElevatedButton(pathName: '/retrofitGetData', text: 'Get Data',),
         ],
       ),
     ),
   );
  }
}
