import 'dart:developer';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final TextEditingController geliControl;

  const SettingsPage({Key? key, required this.geliControl}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool chechboxValue = false;
final _nameController = TextEditingController();
final _surnameController = TextEditingController();

final _locationController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final deneme = TextEditingController();

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarDesign(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _themeColorsChangeWidget(),


              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  children: [
                    TextformfieldWidget(
                      labelText: "İsim",
                      controller: widget.geliControl,
                    ),
                    TextformfieldWidget(
                      labelText: "Soyisim",
                      controller: _surnameController,
                    ),
                    TextformfieldWidget(
                      labelText: "Location",
                      controller: _locationController,
                    ),
                    TextformfieldWidget(
                      labelText: "Email",
                      controller: _emailController,
                    ),
                    TextformfieldWidget(
                      labelText: "Password",
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),

              Center(
                  child: TextButton.icon(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          fixedSize: const Size(180, 50)),
                      onPressed: () {},
                      icon: const Icon(Icons.download_done_rounded,
                          color: Colors.white),
                      label: const Text(
                        "Kaydet",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )
                  )
              ),
              const SizedBox(height: 100),
              const ListTile(
                leading: Text(
                  "Bize ulaşabilirsiniz ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  "isoysal12@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  SwitchListTile _themeColorsChangeWidget() {
    return SwitchListTile(

      value: chechboxValue,
      title: const Text(
        "Tema Rengi",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      dense: true,
      //    inactiveTrackColor: Colors.red,
      activeTrackColor: Colors.green,
      onChanged: (bool value) {
        setState(() {
          chechboxValue = value;
          log(" chechboxValue new value  = $chechboxValue");
        });
      },
    );
  }

  AppBar _appbarDesign() {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
              50), // You can adjust this value to change the shape
        ),
      ),
      centerTitle: false, // Center the title
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 25, // Adjust the size as needed
          color: Colors.white, // Make the icon white
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
  });

  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          validator: (value) {
            if (value!.isEmpty) {
              return 'boş olamaz';
            }
            return null;
          },
        ),
      ],
    );
  }
}