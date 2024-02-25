import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/chat_bubble.dart';
import 'package:messages_chat_app/common/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static String id = 'ChatScreen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(kAppLogo, height: 55,),
            Text('Message', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ChatBubbble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: kPrimaryColor),
                suffixIcon: Icon(Icons.send, color: kPrimaryColor,),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor
                  ),
                  borderRadius: BorderRadius.circular(30)
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
