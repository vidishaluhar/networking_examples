import 'dart:io';

import 'package:flutter/material.dart';
import 'package:networking_examples/main.dart';
import 'package:networking_examples/services/dio_services.dart';

class DioExample extends StatelessWidget {
  const DioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomElevatedButton(
              pathName: '/dioGetData',
              text: 'Dio Get Data',
            ),
            ElevatedButton(
              onPressed: () async {
                // print(await DioService.downloadFile());
                final fileData = await DioService.downloadFile();
                if (context.mounted) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: Colors.purple.shade50,
                          title: const Text("Your file is downloaded",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                          contentPadding: const EdgeInsets.all(25),
                          children: [
                            Text(
                              "$fileData",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black),
                            )
                          ],
                        );
                      });
                }
              },
              child: const Text("Download File",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final fileData = await DioService.uploadFile();
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            backgroundColor: Colors.purple.shade50,
                            title: const Text("Your file is Uploaded",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                            contentPadding: const EdgeInsets.all(25),
                            children: [
                              Text(
                                "$fileData",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text("Upload File",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final postData = await DioService.postData();
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("Data Inserted Successfully",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black)),
                            backgroundColor: Colors.purple.shade50,
                            contentPadding: const EdgeInsets.all(25),
                            children: [
                              Text(
                                "$postData",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text("Post Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final putData = await DioService.putData();
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("Data Updated Successfully",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black)),
                            backgroundColor: Colors.purple.shade50,
                            contentPadding: const EdgeInsets.all(25),
                            children: [
                              Text(
                                "$putData",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text("Put Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final patchData = await DioService.patchData();
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("Data Updated Successfully",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black)),
                            backgroundColor: Colors.purple.shade50,
                            contentPadding: const EdgeInsets.all(25),
                            children: [
                              Text(
                                "$patchData",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text("Patch Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final deleteData = await DioService.deleteData();
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("Data Deleted Successfully",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black)),
                            backgroundColor: Colors.purple.shade50,
                            contentPadding: const EdgeInsets.all(25),
                            children: [
                              Text(
                                "$deleteData",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text("Delete Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
