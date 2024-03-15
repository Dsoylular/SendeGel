import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.purple,
            child: const SizedBox(
              width: double.infinity,
              height: 350,
              child: Center(
                child: Text(
                  "Sende Gel",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}