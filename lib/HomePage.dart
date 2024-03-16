import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String argument;

  const HomePage({Key? key, required this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
        child: Text(argument),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          switch (index) {
            case 0:
            // TODO: Navigate to Event Bul Ekranı
              break;
            case 1:
            // TODO: Navigate to ANA EKRAN
              break;
            case 2:
            // TODO: Navigate to  Profil
              break;
          }
        },
      ),
    );
  }
}
