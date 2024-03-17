import 'package:flutter/material.dart';

class GeziWidget extends StatelessWidget {
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              'SendeGel',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.deepPurple],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50), // You can adjust this value to change the shape
            ),
          ),
          centerTitle: true, // Center the title
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              size: 25, // Adjust the size as needed
              color: Colors.white, // Make the icon white
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        body: const Column(
          children: [
            Center(child: Text("Gezi sayfasına geldin!")),
            // TODO: GEZİ SAYFASI BURADA TASARLANACAK!
          ],
        )
    );
  }

  const GeziWidget({Key? key, required this.text}) : super(key: key);
}