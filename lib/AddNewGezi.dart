import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewGeziWidget extends StatelessWidget {
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white, // Change the color of the back button here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50), // You can adjust this value to change the shape
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust the radius to your preference
              child: Image.asset(
                'lib/images/img.png',
                fit: BoxFit.cover,
                width: 300, // Adjust the width and height of the image container as needed
                height: 200,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 200,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all( // Add border
                color: Colors.black, // Border color
                width: 2, // Border width
              ),
            ),
            child: const Center(
              child: Text(
                "Kadıköy Gezisi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),
          Container(
            color: Colors.purple,
              height: 5,
              width: double.infinity
          ),
          SizedBox(height: 25),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple, // Set border color to purple
                  ),
                  borderRadius: BorderRadius.circular(10), // Set border radius to make it a rounded rectangle
                ),
                child: const Center(
                  child: Text(
                    "Gezi Organizatörü İsmi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 30),
              Text("Deniz Soylular"),
            ],
          ),
          SizedBox(height: 30),

        ],
      ),
    );
  }

  const NewGeziWidget({super.key, required this.text});
}