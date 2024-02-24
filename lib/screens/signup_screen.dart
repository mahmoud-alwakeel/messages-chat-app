import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/common/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static String id = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/scholar.png', height: 130,),
            const Text(
              'Messages',
              style: TextStyle(
                  color: Colors.white, fontSize: 32, fontFamily: 'pacifico'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  "SignUp",
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
                  'SignUp',
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
                const Text("Already have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    ' SignIn',
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
