import 'package:flutter/material.dart';
import 'package:messages_chat_app/screens/signin_screen.dart';
import 'package:messages_chat_app/screens/signup_screen.dart';

void main() {
  runApp(const Messages());
}

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SiginInScreen.id : (context) => const SiginInScreen(),
        SignUpScreen.id : (context) => const SignUpScreen(),
      },
      initialRoute: SiginInScreen.id,
    );
  }
}