import 'package:flutter/material.dart';
import 'package:networking_examples/model/chopper_model.dart';
import 'package:networking_examples/services/chopper_service.dart';

class ChopperExample extends StatelessWidget {
  ChopperExample({super.key});

  final chopperApiService = ChopperApiService.create();

  final postData = ChopperModel(userId: 11, title: "Vidisha Luhar");

  final putData = ChopperModel(userId: 11, title: "Priyanshi Pandya");


  final patchData = <String,dynamic>{
    'Department' : 'Flutter'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///Get Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 500, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.getData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.black),
                              );
                            } else {
                              final List listOfData = snapshot.data?.body;
                              final data = listOfData
                                  .map((e) => ChopperModel.fromJson(e))
                                  .toList();
                              return ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(25),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Text(
                                      "${data[index].userId}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    contentPadding: const EdgeInsets.all(8),
                                    subtitle: const Divider(
                                        color: Colors.black, thickness: 1),
                                    title: Text("${data[index].title}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Get Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),

          ///Get Specific Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 500, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.getSpecificData(10),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final data =
                                  ChopperModel.fromJson(snapshot.data?.body);
                              debugPrint(data.title);
                              return ListTile(
                                subtitle: const Divider(color: Colors.black,thickness: 1),
                                title: Text("${data.title}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                leading: Text("${data.userId}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black));
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Get Specific Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),

          ///Post Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 250, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.postData(postData),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final data = ChopperModel.fromJson(snapshot.data?.body);
                              return Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Status Code : ${snapshot.data?.statusCode}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "UserId : ${data.userId}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Title : ${data.title}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black));
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Post Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),


          ///Put Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 250, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.putData(10,putData),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final data = ChopperModel.fromJson(snapshot.data?.body);
                              return Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Status Code : ${snapshot.data?.statusCode}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "UserId : ${data.userId}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Title : ${data.title}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black));
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Put Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),

          ///Patch Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 250, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.patchData(3,patchData),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {

                              return Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Status Code : ${snapshot.data?.statusCode}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${snapshot.data?.body}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black));
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Patch Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),


          ///Delete Data
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheet(
                      backgroundColor: Colors.teal.shade50,
                      elevation: 25,
                      constraints: const BoxConstraints(
                          minHeight: 250, minWidth: double.infinity),
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: chopperApiService.deleteData(10),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Status Code : ${snapshot.data?.statusCode}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Connection State : ${snapshot.connectionState}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Body : ${snapshot.data?.body}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black));
                            }
                          },
                        );
                      },
                    );
                  });
            },
            child: const Text("Delete Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          const SizedBox(height: 25),
        ],
      )),
    );
  }
}
