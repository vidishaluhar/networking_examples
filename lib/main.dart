import 'package:flutter/material.dart';
import 'package:networking_examples/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Networking & Web Services"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              pathName: '/http',
              text: 'Http',
            ),
            CustomElevatedButton(
              pathName: '/dio',
              text: 'Dio',
            ),
            CustomElevatedButton(
              pathName: '/retrofitExample',
              text: 'Retrofit',
            ),
            CustomElevatedButton(
              pathName: '/chopper',
              text: 'Chopper',
            ),
            CustomElevatedButton(
              pathName: '/completerExample',
              text: 'Completer Example',
            ),
          ],
        ),
      ),
    );
  }
}

///Custom Elevated Button
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.pathName,
    required this.text,
  });

  final String pathName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size.fromWidth(250))),
        onPressed: () {
          Navigator.pushNamed(context, pathName);
        },
        child: Text(text,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
      ),
    );
  }
}
