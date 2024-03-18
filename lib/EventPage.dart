import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String text;

  const EventWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    // TODO: FILTER EKRANINA GİDİLECEK YAZILMASI LAZIM
                  },
                  child: Icon(Icons.filter_list),
              ),
              SizedBox(width: 8),
            ],
          ),
          // TODO: BURASI TASARLANACAK
        ],
      ),
    );
  }
}
