import 'package:appjamteam39/LogicalData/Member.dart';
import 'package:appjamteam39/LogicalData/Event.dart';
import 'package:appjamteam39/LogicalData/startDataBase.dart';
import 'package:flutter/material.dart';
import '../GeziPage.dart';
import 'EventButton.dart';




class HomeWidget extends StatefulWidget {
  List<Member> members;
  List<Event> events;
  Member currentUser;

  HomeWidget({super.key, required this.currentUser, required this.members, required this.events});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  void myCustomSetState() {
    setState(() {
    });
  }


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
                  alignment: Alignment.center,
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
                      itemCount: widget.currentUser.createdEvent.length,//attendedItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.currentUser.createdEvent[index].name;
                        final img = widget.currentUser.createdEvent[index].imagePath;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: EventButton(buttonText: item, image: img, event: widget.currentUser.createdEvent[index],),
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
                  alignment: Alignment.center,
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
                  itemCount: widget.currentUser.joinedEvent.length,
                  itemBuilder: (context, index) {
                    final item = widget.currentUser.joinedEvent[index].name;
                    final img = widget.currentUser.joinedEvent[index].imagePath;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: EventButton(buttonText: item, image: img, event: widget.currentUser.joinedEvent[index]),
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
                        MaterialPageRoute(builder: (context) => AddNewTravelPage(currenUser: widget.currentUser,callback: (){setState(() {});},)),

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
