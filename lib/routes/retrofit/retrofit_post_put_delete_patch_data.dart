import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/retrofit_model.dart';
import 'package:networking_examples/services/retrofit_services.dart';

import 'error_handling.dart';

class RetrofitPostDataExample extends StatelessWidget {
  RetrofitPostDataExample({super.key});

  final apiService =
      ApiService(Dio(BaseOptions(contentType: 'application/json')));

  final postData = RetrofitModel(
    userId: 1,
    id: 1,
    title: 'Post Example',
    body: 'This is the example of retrofit @Post',
  );

  final patchData = RetrofitModel(
    userId: 1,
    id: 1,
    title: 'Patch Example',
    body: 'This is the example of retrofit @PATCH',
  );

  final putData = RetrofitModel(
      userId: 1,
      id: 1,
      title: 'Put Example',
      body: 'This is the example of Retrofit @Put');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Post Data",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
            ),
            FutureBuilder(
              future: apiService.postData(postData),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final RetrofitModel? data = snapshot.data;
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 5,
                    borderOnForeground: true,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      subtitle: Text("${data?.body}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.limeAccent,
                        // minRadius: 25,
                        child: Text("${data?.userId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      title: Text("${data?.title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
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


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Put Data",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
            ),
            FutureBuilder(
              future: apiService.updatePostData('1',putData),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final RetrofitModel? data = snapshot.data;
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 5,
                    borderOnForeground: true,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      subtitle: Text("${data?.body}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.limeAccent,
                        // minRadius: 25,
                        child: Text("${data?.userId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      title: Text("${data?.title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
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


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Patch Data",
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
            ),
            FutureBuilder(
              future: apiService.patchData('1',patchData),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final RetrofitModel? data = snapshot.data;
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 5,
                    borderOnForeground: true,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      subtitle: Text("${data?.body}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.limeAccent,
                        // minRadius: 25,
                        child: Text("${data?.userId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      title: Text("${data?.title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
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


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Part Form Data",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
            ),
            FutureBuilder(
              future: apiService.postSpecificData('1',postData,'Vidisha'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final RetrofitModel? data = snapshot.data;
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 5,
                    borderOnForeground: true,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      subtitle: Text("${data?.body}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.limeAccent,
                        // minRadius: 25,
                        child: Text("${data?.userId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      title: Text("${data?.title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
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


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Delete Data",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
            ),
            FutureBuilder(
              future: apiService.deleteData('1'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final RetrofitModel? data = snapshot.data;
                  return Card(
                    color: Colors.red.shade50,
                    elevation: 5,
                    borderOnForeground: true,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      subtitle: Text("${data?.body}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.limeAccent,
                        // minRadius: 25,
                        child: Text("${data?.userId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      title: Text("${data?.title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
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

          ],
        ),
      ),
    );
  }
}
