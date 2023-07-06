import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/retrofit_model.dart';
import 'package:networking_examples/services/retrofit_services.dart';

class RetrofitGetData extends StatelessWidget {
   RetrofitGetData({super.key});

  final apiService =
  ApiService(Dio(BaseOptions(contentType: 'application/json')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<RetrofitModel>? data = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(10),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(data![index].title),
                    contentPadding: EdgeInsets.all(8),
                    leading: Text("${data[index].userId}"),
                    subtitle: Text(data[index].body),
                    tileColor: Colors.red.shade50,
                    minLeadingWidth: 5,
                    subtitleTextStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
