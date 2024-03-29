import 'package:flutter/material.dart';
import '../AddNewGezi.dart';
import '../LogicalData/Event.dart'; // Import the necessary file(s) here

// Define a StatelessWidget for EventButton
class EventButton extends StatelessWidget {
  // Declare variables for button text and image path
  final String buttonText;
  final String image;
  final Event event;

  // Constructor for EventButton
  const EventButton({
    super.key,
    required this.buttonText,
    required this.image,
    required this.event,
  });

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
            MaterialPageRoute(builder: (context) => GeziWidget(text: "test", image: image, event: event)),
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
            Center(
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
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
