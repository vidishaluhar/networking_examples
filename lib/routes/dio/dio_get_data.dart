import 'package:flutter/material.dart';
import 'package:networking_examples/services/dio_services.dart';

class DioGetData extends StatelessWidget {
  const DioGetData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: DioService.fetchData(),
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
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(8),
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: Text(
                            "${data?[index].userId}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          title: Text(
                            "${data?[index].title}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },),
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
