import 'package:flutter/material.dart';
import 'package:networking_examples/services/http_service.dart';

class PatchRequest extends StatefulWidget {
  const PatchRequest({super.key});

  @override
  State<PatchRequest> createState() => _PatchRequestState();
}

class _PatchRequestState extends State<PatchRequest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: HttpService.updateItemOfMapData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
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
