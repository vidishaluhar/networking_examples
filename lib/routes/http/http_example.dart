import 'package:flutter/material.dart';
import 'package:networking_examples/main.dart';
import 'package:networking_examples/services/http_service.dart';

class HttpExample extends StatelessWidget {
  HttpExample({super.key}){}

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Requests"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(pathName: '/httpGet', text: 'Get Request',),
              CustomElevatedButton(pathName: '/httpPost', text: 'Post Request',),
              CustomElevatedButton(pathName: '/httpPut', text: 'Put Request',),
              CustomElevatedButton(pathName: '/httpPatch', text: 'Patch Request',),
              CustomElevatedButton(pathName: '/httpDelete', text: 'Delete Request',),
            ],
          ),
        ),
      ),
    );
  }
}
