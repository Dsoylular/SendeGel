import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String text;

  const ProfileWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            Center(child: Text("Profil Sayfasına geldin!")),
            // TODO: BURASI TASARLANACAK
          ],
        )
    );
  }
}