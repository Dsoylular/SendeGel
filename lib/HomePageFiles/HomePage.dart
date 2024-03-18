import 'package:flutter/material.dart';

import '../GeziPage.dart';
import 'EventButton.dart';

class HomeWidget extends StatelessWidget {
  final String text;

  const HomeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<String> attendedItems = [
      'Gezi 1', // Example attended events
      'Gezi 2',
      'Gezi 3',
    ];
    List<String> organizedItems = [
      'Organize 1', // Example organized events
      'Organize 2',
      'Organize 3',
    ];
    List<String> attendedImages = [
      'assets/images/img_1.png',
      'assets/images/img_2.png',
      'assets/images/img_3.png',
    ];
    List<String> organizedImages = [
      'assets/images/img_4.png',
      'assets/images/img_5.png',
      'assets/images/img_6.png',
    ];

    ScrollController attendedItemsController = ScrollController();
    ScrollController organizedItemsController = ScrollController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.06),
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.025),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Planlanmış Gezilerim",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.0125),
            SizedBox(
              height: screenHeight * 0.25,
              child: attendedItems.isEmpty
                  ? const Center(child: Text('Planlanmış geziniz yok, eklemek için tıklayın'))
                  : Scrollbar(
                controller: attendedItemsController,
                thumbVisibility: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: attendedItemsController,
                  shrinkWrap: true,
                  itemCount: attendedItems.length,
                  itemBuilder: (context, index) {
                    final item = attendedItems[index];
                    final img = attendedImages[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: EventButton(buttonText: item, image: img),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
                borderRadius: BorderRadius.circular(screenWidth * 0.06),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.025),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Organize Ettiğim Geziler",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            SizedBox(
              height: screenHeight * 0.3,
              child: organizedItems.isEmpty
                  ? Center(child: Text('Planlanmış geziniz yok, eklemek için tıklayın'))
                  : Scrollbar(
                controller: organizedItemsController,
                thumbVisibility: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: organizedItemsController,
                  shrinkWrap: true,
                  itemCount: organizedItems.length,
                  itemBuilder: (context, index) {
                    final item = organizedItems[index];
                    final img = organizedImages[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: EventButton(buttonText: item, image: img),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewGeziWidget(text: "text")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
