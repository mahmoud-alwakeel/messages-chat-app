import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/models/message_model.dart';

class ChatBubbble extends StatelessWidget {
  const ChatBubbble({super.key, required this.messageModel});
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )
          ),
          child: Text(
            messageModel.message.toString(), 
          style: const TextStyle(color: Colors.white),),
        ),
    );
  }
}