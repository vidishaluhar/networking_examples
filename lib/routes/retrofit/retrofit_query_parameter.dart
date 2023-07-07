import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/retrofit_model.dart';
import 'package:networking_examples/routes/retrofit/error_handling.dart';
import 'package:networking_examples/services/retrofit_services.dart';

class RetrofitQueryParameterExample extends StatelessWidget {
  RetrofitQueryParameterExample({super.key});

  final apiService =
      ApiService(Dio(BaseOptions(contentType: 'application/json')));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: apiService.getDataUptoQueryParameter(5),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<RetrofitModel>? data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.grey.shade300,
                      title: Text(
                        "${data?[index].title}",
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
                            "${data?[index].userId}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          )),
                      subtitle: Text("${data?[index].body}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.grey.shade500)),
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              ServerError.withError();
              return Container();
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
