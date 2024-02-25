import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/common/custom_button.dart';
import 'package:messages_chat_app/common/custom_text_field.dart';
import 'package:messages_chat_app/screens/signup_screen.dart';

class SiginInScreen extends StatelessWidget {
  const SiginInScreen({super.key});

  static String id = 'SignIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/scholar.png',
              height: 130,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'pacifico'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  "SignIn",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'pacifico'),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
 
              hintText: 'email'),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(hintText: 'password'),
            const SizedBox(
              height: 30,
            ),
            CustomButton(

              text: 'SignIn',),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                  child: const Text(
                    ' SignUp',
                    style: TextStyle(
                      color: Color(0xffc7ede6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}