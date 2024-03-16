import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EntryState();
  }
}

class _EntryState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double headerHeightRatio = 0.4;

    final double spacingRatio = 0.04;

    final double inputWidthRatio = 0.8;

    final double inputHeightRatio = 0.07;

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
                  "Sende Gel",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (spacingRatio*2)),
            Container(
              width: screenSize.width * inputWidthRatio,
              height: screenSize.height * inputHeightRatio,
              padding: EdgeInsets.all(screenSize.width * 0.02),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenSize.width * 0.1),
              ),
              child: const TextField(
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
              child: const TextField(
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
                //TODO: Implement login functionality
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.35,
                    vertical: screenSize.width * 0.04
                ),
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
                  ),
                  TextSpan(
                    text: 'Register',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
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
