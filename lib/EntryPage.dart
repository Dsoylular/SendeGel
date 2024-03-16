import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EntryState();
  }
}

class _EntryState extends State<EntryPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    const double headerHeightRatio = 0.4;
    const double spacingRatio = 0.04;
    const double inputWidthRatio = 0.8;
    const double inputHeightRatio = 0.07;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * headerHeightRatio,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "SendeGel",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (spacingRatio * 2)),
            Container(
              width: screenSize.width * inputWidthRatio,
              height: screenSize.height * inputHeightRatio,
              padding: EdgeInsets.all(screenSize.width * 0.02),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenSize.width * 0.1),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * spacingRatio),
            Container(
              width: screenSize.width * inputWidthRatio,
              height: screenSize.height * inputHeightRatio,
              padding: EdgeInsets.all(screenSize.width * 0.02),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenSize.width * 0.1),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.key),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (spacingRatio * 3)),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                //TODO: BU EMAIL VE PASSWORD DOĞRU MU CHECK YAPILMALI BUNA GÖRE ALT SATIRA GEÇECEK

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(argument: email)),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.35,
                    vertical: screenSize.width * 0.04),
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (spacingRatio * 2.4)),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenSize.width * 0.05,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: "Don't have an account ? ",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  TextSpan(
                    text: 'Register',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // print("register");
                        // TODO: Register ekranına yönlendirme yapılacak
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
