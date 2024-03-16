import 'package:appjamteam39/EventPage.dart';
import 'package:appjamteam39/HomePage.dart';
import 'package:appjamteam39/ProfilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String argument;

  const HomePage({Key? key, required this.argument}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final tabs = [
      const EventWidget(text: "text"),
      const HomeWidget(text: "text"),
      const ProfileWidget(text: "text"),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'SendeGel',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
        ),
        toolbarHeight: 75,
        centerTitle: false, // Center the title
      ),
      body: Center(
        // child: Text(widget.argument),
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Etkinlik Bul',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.purple,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
            // TODO: Navigate to EventBul
              break;
            case 1:
            // TODO: Navigate to ANA EKRAN
              break;
            case 2:
            // TODO: Navigate to Profile
              break;
          }
        },
      ),
    );
  }
}
