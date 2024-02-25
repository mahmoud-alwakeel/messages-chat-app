import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/firebase_options.dart';
import 'package:messages_chat_app/screens/chat_screen.dart';
import 'package:messages_chat_app/screens/signin_screen.dart';
import 'package:messages_chat_app/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Messages());
}

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SiginInScreen.id : (context) => SiginInScreen(),
        SignUpScreen.id : (context) => SignUpScreen(),
        ChatScreen.id : (context) => const ChatScreen(),
      },
      initialRoute: ChatScreen.id,
    );
  }
}