import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/common/custom_button.dart';
import 'package:messages_chat_app/common/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static String id = 'SignUp';
  String? email;
  String? password;

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
            Image.asset(
              'assets/images/scholar.png',
              height: 130,
            ),
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
            CustomTextField(
              hintText: 'email',
              onChanged: (data) {
                email = data;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              hintText: 'password',
              onChanged: (data) {
                password = data;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () async {
                try {
                  await registerUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showSnackBar(
                      context,
                      message: "The password provided is too weak",
                    );
                  } else if (e.code == 'email-already-in-use') {
                    showSnackBar(
                      context,
                      message: "The account already exists for that email",
                    );
                  }
                }
                showSnackBar(
                  context,
                  message: "succesfuly Signed Up",
                );

                // print(userCredential.user!.displayName);
              },
              text: 'SignUp',
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

  void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
