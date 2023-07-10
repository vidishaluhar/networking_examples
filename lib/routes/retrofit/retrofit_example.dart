import 'package:flutter/material.dart';
import 'package:networking_examples/main.dart';

class RetrofitExample extends StatelessWidget {
  const RetrofitExample({super.key});



  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomElevatedButton(pathName: '/retrofitGetData', text: 'Get Data',),
           CustomElevatedButton(pathName: '/retrofitGetSpecificData', text: 'Get Specific Data',),
           CustomElevatedButton(pathName: '/retrofitQueryParameter', text: 'Query Parameter',),
           CustomElevatedButton(pathName: '/retrofitPostData', text: 'Post Data',),
         ],
       ),
     ),
   );
  }
}
