import 'package:flutter/material.dart';
import 'package:networking_examples/services/http_service.dart';

class PutRequest extends StatefulWidget {
  const PutRequest({super.key});

  @override
  State<PutRequest> createState() => _PutRequestState();
}

class _PutRequestState extends State<PutRequest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: HttpService.updateMapData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print("id: ${snapshot.data?.userId}");
                    return Text("Error Occured : ${snapshot.error}");
                  } else {
                    final data = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data?.userId}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${data?.title}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
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
