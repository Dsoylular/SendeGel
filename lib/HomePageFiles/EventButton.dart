import 'package:flutter/material.dart';
import '../AddNewGezi.dart';

class EventButton extends StatelessWidget {
  final String buttonText;
  final String image;
  const EventButton({Key? key, required this.buttonText, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String helper = image;
    return Container(
      width: 350,
      height: 100, // Adjust the height according to your image size
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple, width: 2.5),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GeziWidget(text: "test", image: helper)),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover, // Cover the entire button with the image
            ),
            Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to contrast with the background image
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
