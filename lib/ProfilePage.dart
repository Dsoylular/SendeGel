import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String text;

  const ProfileWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    String name = "Deniz";
    String surName = "Soylular";
    String email = "dsoylular22@ku.edu.tr";
    String password = "123456";
    String dateOfBirth = "01.07.2003";

    return Scaffold(
      appBar: _appBarDesign(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profil image kısmı
              const Center(
                child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/images/img.png'),
                ),
              ),

              const SizedBox(height: 20),
              NameTextWidget(
                name: "Name",
                nameTwo: name,
              ),
              NameTextWidget(
                name: "Surname",
                nameTwo: surName,
              ),
              NameTextWidget(
                name: "E-mail",
                nameTwo: email,
              ),
              NameTextWidget(
                name: "Password",
                nameTwo: password,
              ),
              NameTextWidget(
                  name: "Date of Birth",
                  nameTwo: dateOfBirth
              ),


              const SizedBox(height: 20),

              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );

  }
  AppBar _appBarDesign(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        "My Profile",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NameTextWidget extends StatelessWidget {
  const NameTextWidget({
    super.key,
    required this.name,
    required this.nameTwo,
  });

  final String nameTwo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          nameTwo,
          style: const TextStyle(fontSize: 18),
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}