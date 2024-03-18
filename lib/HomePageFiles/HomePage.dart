import 'package:appjamteam39/HomePageFiles/EventButton.dart';
import 'package:flutter/material.dart';

import '../GeziPage.dart';

class HomeWidget extends StatelessWidget {
  final String text;

  const HomeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> attendedItems = [
      'Gezi 1', //Örnek katılanacak geziler
      'Gezi 2',
      'Gezi 3',
      'Gezi 4',
    ];
    List<String> organizedItems = [
      'Organize 1', //Örnek düzenlenen geziler
      'Organize 2',
      'Organize 3',
      'Organize 4',
    ];

    ScrollController attendedItemsController = ScrollController();
    ScrollController organizedItemsController = ScrollController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // border radius
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      "Planlanmış Gezilerim",
                      style: TextStyle(
                        color: Colors.white, // text color
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: attendedItems.isEmpty
                  ? const Center(child: Text('Planlanmış geziniz yok, eklemek için tıklayın'))
                  : Scrollbar(
                controller: attendedItemsController,
                thumbVisibility: true,
                child: ListView(
                  controller: attendedItemsController,
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
                gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purple]), // gradient colors
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      "Organize Ettiğim Geziler",
                      style: TextStyle(
                        color: Colors.white, // text color changed to white for better visibility
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 200,
              child: organizedItems.isEmpty
                  ? const Center(child: Text('Planlanmış geziniz yok, eklemek için tıklayın'))
                  : Scrollbar(
                controller: organizedItemsController,
                thumbVisibility: true,
                child: ListView(
                  controller: organizedItemsController,
                  shrinkWrap: true,
                  itemExtent: 55,
                  children: organizedItems
                      .map((item) => Center(child: EventButton(buttonText: item)))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50, // Adjust width as needed
                  height: 50, // Adjust height as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Makes the container circular
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(color: Colors.black, width: 2), // Border color and width
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewGeziWidget(text: "text")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove padding
                      shape: const CircleBorder(), // Makes the button circular
                      backgroundColor: Colors.transparent, // Transparent background
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
