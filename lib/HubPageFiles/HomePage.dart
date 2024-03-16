import 'package:appjamteam39/HubPageFiles/EventButton.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String text;

  const HomeWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> attendedItems = [
      'Gezi 1',
      'Gezi 2',
      'Gezi 3',
      'Gezi 4',
      'Gezi 5',
      'Gezi 6',
    ];
    List<String> organizedItems = [
      'Organize 1',
      'Organize 2',
      'Organize 3',
      'Organize 4',
      'Organize 5',
      'Organize 6',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple), // border color
                borderRadius: BorderRadius.circular(20), // border radius
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Planlanmış Gezilerim",
                    style: TextStyle(
                      color: Colors.purple, // text color
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: attendedItems.isEmpty
                  ? Center(child: Container(child: Text('Planlanmış geziniz yok, eklemek için tıklayın')))
                  : Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 55,
                  children: attendedItems
                      .map((item) => Center(child: EventButton(buttonText: item)))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple), // border color
                borderRadius: BorderRadius.circular(20), // border radius
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Organize Ettiğim Geziler",
                    style: TextStyle(
                      color: Colors.purple, // text color
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 200,
              child: attendedItems.isEmpty
                  ? Center(child: Container(child: Text('Planlanmış geziniz yok, eklemek için tıklayın')))
                  : Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 55,
                  children: organizedItems
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
