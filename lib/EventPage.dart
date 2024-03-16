import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String text;

  const EventWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(child: Text("Event Bul Sayfasına geldin!")),
          // TODO: BURASI TASARLANACAK
        ],
      )
    );
  }
}