import 'package:appjamteam39/SignUpPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'HubPage.dart';
import 'package:appjamteam39/LogicalData/Member.dart';
import 'package:appjamteam39/LogicalData/Event.dart';
import 'package:appjamteam39/LogicalData/startDataBase.dart';

class EntryPage extends StatefulWidget {
  List<Member> members;
  List<Event> events;
  Member currentUser;

  EntryPage(
      {super.key,
        required this.currentUser,
        required this.members,
        required this.events});

  @override
  State<StatefulWidget> createState() {
    return _EntryState();
  }
}

class _EntryState extends State<EntryPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
// deneme commit
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

  bool obsourceText = true;
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
                decoration: const InputDecoration(
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
                obscureText: obsourceText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obsourceText = !obsourceText;
                        });
                      },
                      child: Icon(obsourceText
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.key),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (spacingRatio * 3)),
            ElevatedButton(
              onPressed: () {
                if (_passwordController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                          currentUser: widget.currentUser,
                          members: members,
                          events: events,
                        )),
                  );
                } else {
                  _showPopup(context);
                }
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
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

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uyarı!'),
          content: Text('Lütfen boş alan bırakmayınız'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}
