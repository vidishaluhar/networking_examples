import 'package:flutter/material.dart';
import 'package:networking_examples/services/http_service.dart';

class GetRequest extends StatefulWidget {
  const GetRequest({super.key});

  @override
  State<GetRequest> createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: HttpService.fetchDataFromHttpApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error Occured : ${snapshot.error}");
                  } else {
                    final data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final item = data?[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffe4e4e4),
                                        blurRadius: 25,
                                        offset: Offset((0.1), (0.1)),
                                        spreadRadius: -0)
                                  ]),
                              child: ListTile(
                                title: Text(
                                  '${item?.userId}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(item?.title ?? "",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
