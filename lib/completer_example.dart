import 'dart:async';

import 'package:flutter/material.dart';

class CompleterExample extends StatelessWidget {
  const CompleterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print(await doSomething());
          },
          child: Text("Check Example",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  Future<String> doSomething() {
    final Completer<String> completer = Completer<String>();
    Timer(
      Duration(seconds: 3),
      () {
        print("Do Something !!");
        completer.complete('Completed !!');
      },
    );
    return completer.future;
  }
}
