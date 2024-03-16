import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String argument;

  const HomePage({Key? key, required this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(argument),
      ),
    );
  }
}
