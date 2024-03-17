import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final String text;

  const ChatWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = ["10.00 gibi meydanda buluşalım mı?", "Merhabalar, ben Deniz!"]; // List to hold messages

  // Function to send a message
  void _sendMessage() {
    setState(() {
      _messages.insert(0, _textEditingController.text); // Insert message at the beginning of the list
      _textEditingController.clear(); // Clear the input field after sending message
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = "${now.hour}:${now.minute}";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            bottom: Radius.circular(50), // You can adjust this value to change the shape
          ),
        ),
        centerTitle: false, // Center the title
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            size: 25, // Adjust the size as needed
            color: Colors.white, // Make the icon white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Start from the bottom of the list
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent, // Set background color to purple
                      borderRadius: BorderRadius.circular(20.0), // Set border radius
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _messages[index],
                          style: const TextStyle(
                            color: Colors.white, // Set text color to white
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 5.0), // Add some spacing
                        Text(
                          _getCurrentTime(), // Show the current time
                          style: const TextStyle(
                            color: Colors.white54, // Set time text color to a lighter shade
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const  InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
