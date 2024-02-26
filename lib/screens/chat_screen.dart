import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/chat_bubble.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/models/message_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'ChatScreen';
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: messages.snapshots(), 
      builder: (context, snapShot) {
      if (snapShot.hasData) {
        List<MessageModel> messagesList = [];
        for (int message = 0; message < snapShot.data!.docs.length; message++) {
          messagesList.add(MessageModel.fromJson(snapShot.data!.docs[message]));
        }
        //print(snapShot.data!.docs[0]['message']);
        return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(kAppLogo, height: 55,),
            const Text('Message', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesList.length,
              itemBuilder: (context, index) {
                return ChatBubbble(messageModel: messagesList[index],);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                messages.add({
                  'message': data
                });
                controller.clear();
              },
              decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: const TextStyle(color: kPrimaryColor),
                suffixIcon: const Icon(Icons.send, color: kPrimaryColor,),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
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
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    );
  }
}
