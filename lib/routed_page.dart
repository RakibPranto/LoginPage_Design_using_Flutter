import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoutedPage extends StatefulWidget {
  const RoutedPage({Key? key}) : super(key: key);

  @override
  State<RoutedPage> createState() => _RoutedPageState();
}

class _RoutedPageState extends State<RoutedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RoutedPage"),
      ),
      body: Center(
        child: Text("Login Successfull",
          style: TextStyle(
              color: Colors.black,
              fontSize: 30)
        ),
      ),
    );
  }
}
