import 'package:flutter/material.dart';

import '../AddNewGezi.dart';
import '../GeziPage.dart';

class EventButton extends StatelessWidget {
  final String buttonText;

  const EventButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple, width: 2.5),
      ),
      child: ElevatedButton(
        onPressed: () {
          // TODO: GEZİ DETAYLARININ VE CHATİN GÖZÜKTÜĞÜ EKRANA BAĞLAMA NOKTASI
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GeziWidget(text: "text")),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.purple,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
            buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
