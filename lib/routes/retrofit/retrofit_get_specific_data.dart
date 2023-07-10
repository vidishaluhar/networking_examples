import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/retrofit_model.dart';
import 'package:networking_examples/services/retrofit_services.dart';

class RetrofitGetSpecificDataExample extends StatelessWidget {
  RetrofitGetSpecificDataExample({super.key});

  final apiService =
      ApiService(Dio(BaseOptions(contentType: 'application/json')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: apiService.getSpecificData("1"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final RetrofitModel? data = snapshot.data;
              return ListTile(
                tileColor: Colors.grey.shade300,
                title: Text(
                  "${data?.title}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: const EdgeInsets.all(8),
                leading: CircleAvatar(
                    backgroundColor: Colors.red.shade500,
                    child: Text(
                      "${data?.userId}",
                      style: const TextStyle(color: Colors.black,fontSize: 25),
                    )),
                subtitle: Text("${data?.body}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey.shade500)),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
