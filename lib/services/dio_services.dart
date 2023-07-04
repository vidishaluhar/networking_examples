import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/model/dio_model.dart';
import 'package:image_picker/image_picker.dart';

class DioService {
  static final Dio dio = Dio();

  ///Dio Get Request Example
  static Future<List<DioModel>> fetchData() async {
    List<DioModel> dioModal = [];
    const url = 'https://jsonplaceholder.typicode.com/albums/';
    try {
      final response = await dio.get(url);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("API call successful");
        debugPrint(
            "Response Data : ${(response.data).map((e) => DioModel.fromJson(e))}");
        final data = response.data;
        for (var i in data) {
          dioModal.add(DioModel.fromJson(i));
        }
        return dioModal;
      } else {
        debugPrint("API call failed with status code : ${response.statusCode}");
        debugPrint("Error Message : ${response.data}");
        return [];
      }
    } catch (e) {
      debugPrint("API call failed with Error : $e");
      return [];
    }
  }

  ///Dio Download File Example
  static Future downloadFile() async {
    Completer completer = Completer();
    Directory directory = await getApplicationDocumentsDirectory();
    var response = await dio.download(
        "https://filesamples.com/samples/document/txt/sample1.txt",
        "${directory.path}/file.txt");
    debugPrint("$directory");
    debugPrint(directory.path);
    debugPrint("${directory.path}/file.txt");
    debugPrint("${response.statusCode}");
    completer.complete("Status Code : ${response.statusCode}"
        "\nDirectory path : ${directory.path}/file.txt");
    return completer.future;
  }

  ///Dio Upload File to Server
  static Future uploadFile() async {
    Completer completer = Completer();
    ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);

    String filePath = file.path;
    String fileName = file.path.split('/').last;

    debugPrint(fileName);
    debugPrint(filePath);

    FormData data = FormData.fromMap(<String, dynamic>{
      'key': '3f0305cc0eb2702e2e51b5ddd82a2401',
      'image': await MultipartFile.fromFile(filename: fileName, filePath),
      'name': 'Vidisha.jpg'
    });
    var response = await dio.post(
      "https://api.imgbb.com/1/upload",
      data: data,
      onSendProgress: (count, total) {
        print("$count,$total");
      },
    );
    try {
      if (response.statusCode == 200) {
        debugPrint("File Uploaded Successfully");
      } else {
        debugPrint("Failed to Upload File");
      }
    } catch (e) {
      debugPrint("Error while uploading file... $e");
    }
    debugPrint(response.statusMessage);
    debugPrint("${response.statusCode}");
    completer.complete("Status Message : ${response.statusMessage}"
        "\nStatus Code : ${response.statusCode}"
        "\nSuccess Status : ${response.data['success']}");
    return completer.future;
  }

  ///Dio Post Data Example
  static Future postData() async {
    Completer completer = Completer();
    try {
      var response = await dio.post(
          "https://jsonplaceholder.typicode.com/posts",
          data: {'name': 'Radhika', 'Contact No': '6834683483'});
      completer.complete("Status Code : ${response.statusCode}"
          "\nStatus Message : ${response.statusMessage}"
          "\nResponse Data :${response.data}");
      return completer.future;
    } catch (e) {
      debugPrint("Error while inserting data : $e");
    }
  }

  ///Dio Put Data Example
  static Future putData() async {
    Completer completer = Completer();
    try {
      var response = await dio.put(
          "https://jsonplaceholder.typicode.com/posts/1",
          data: {'name': 'ABC', 'email': 'abc@gmail.com'});
      completer.complete("Status Code : ${response.statusCode}"
          "\nStatus Message : ${response.statusMessage}"
          "\nResponse Data :${response.data}");
      return completer.future;
    } catch (e) {
      debugPrint("Error while updating data : $e");
    }
  }

  ///Dio Patch Data Example
  static Future patchData() async {
    Completer completer = Completer();
    try {
      var response = await dio
          .patch("https://jsonplaceholder.typicode.com/posts/1", data: {
        'name': 'ABC',
        'email': 'abc@gmail.com',
        'contact no': '1112223334',
        'location': 'Ahmedabad',
        'title': 'Data Updated'
      });
      completer.complete("Status Code : ${response.statusCode}"
          "\nStatus Message : ${response.statusMessage}"
          "\nResponse Data :${response.data}");
      return completer.future;
    } catch (e) {
      debugPrint("Error while updating data : $e");
    }
  }

  ///Dio Delete Data Example
  static Future deleteData() async {
    Completer completer = Completer();
    try {
      var response = await dio
          .delete("https://jsonplaceholder.typicode.com/posts/1");
      completer.complete("Status Code : ${response.statusCode}"
          "\nStatus Message : ${response.statusMessage}"
          "\nResponse Data :${response.data}");
      return completer.future;
    } catch (e) {
      debugPrint("Error while deleting data : $e");
    }
  }
}
