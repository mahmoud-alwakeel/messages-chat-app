import 'package:flutter/material.dart';
import 'package:messages_chat_app/screens/login_screen.dart';

void main() {
  runApp(Messages());
}

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}