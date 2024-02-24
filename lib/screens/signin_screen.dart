import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
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
            const CustomTextField(hintText: 'email'),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(hintText: 'password'),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'SignIn',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'pacifico'),
                ),
              ),
            ),
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
