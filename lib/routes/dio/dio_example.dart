import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:networking_examples/main.dart';
import 'package:networking_examples/model/http_model.dart';

class DioExample extends StatelessWidget {
  const DioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomElevatedButton(pathName: '/dioGetData', text: 'Dio Get Data',),
           CustomElevatedButton(pathName: '/dioPostData', text: 'Dio Post Data',),
          ],
        ),
      ),
    );
  }
}
