import 'package:flutter/material.dart';
import '../AddNewGezi.dart'; // Import the necessary file(s) here

// Define a StatelessWidget for EventButton
class EventButton extends StatelessWidget {
  // Declare variables for button text and image path
  final String buttonText;
  final String image;

  // Constructor for EventButton
  const EventButton({
    Key? key,
    required this.buttonText,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container width and height values
    const double containerWidth = 350.0;
    const double containerHeight = 100.0;

    return Container(
      width: containerWidth,
      height: containerHeight,
      // Container decoration for button styling
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple, width: 2.5),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to another screen when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GeziWidget(text: "test", image: image)),
          );
        },
        style: ElevatedButton.styleFrom(
          // Button style adjustments
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
            // Background image for the button
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            // Centered text on top of the image
            Positioned(
              bottom: 10, // Adjust bottom position as needed
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
