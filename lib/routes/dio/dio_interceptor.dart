import 'package:flutter/material.dart';

class DioIntercepterExample extends StatelessWidget {
  const DioIntercepterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size.fromWidth(250)),
              backgroundColor: MaterialStatePropertyAll(Colors.limeAccent)
            ),
            onPressed: () {},
            child: const Text("Dio Login",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 25,),

          ElevatedButton(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(250)),
                backgroundColor: MaterialStatePropertyAll(Colors.tealAccent)
            ),
            onPressed: () {},
            child: const Text("Dio get auth data",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 25,),

          ElevatedButton(
            style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(250)),
                backgroundColor: MaterialStatePropertyAll(Colors.red.shade300)
            ),
            onPressed: () {},
            child: const Text("Clear auth",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      )),
    );
  }
}
