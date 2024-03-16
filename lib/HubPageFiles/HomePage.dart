import 'package:appjamteam39/HubPageFiles/EventButton.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String text;

  const HomeWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> myItems = [
      'Gezi 1',
      'Gezi 2',
      'Gezi 3',
      'Gezi 4',
      'Gezi 5',
      'Gezi 6','Gezi 1',
      'Gezi 2',
      'Gezi 3',
      'Gezi 4',
      'Gezi 5',
      'Gezi 6','Gezi 1',
      'Gezi 2',
      'Gezi 3',
      'Gezi 4',
      'Gezi 5',
      'Gezi 6',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "Yaklaşan Gezilerim",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 320,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 60,
                  children: myItems
                      .map((item) => Center(child: EventButton(buttonText: item)))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
