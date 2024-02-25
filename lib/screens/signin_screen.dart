import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/common/custom_button.dart';
import 'package:messages_chat_app/common/custom_text_field.dart';
import 'package:messages_chat_app/common/utils/common_utils.dart';
import 'package:messages_chat_app/screens/chat_screen.dart';
import 'package:messages_chat_app/screens/signup_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SiginInScreen extends StatefulWidget {
  SiginInScreen({super.key});

  static String id = 'SignIn';

  @override
  State<SiginInScreen> createState() => _SiginInScreenState();
}

class _SiginInScreenState extends State<SiginInScreen> {
  bool isLoading = false;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
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
                    onChanged: (value) {
                      email = value;
                    },
                    hintText: 'email'),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    hintText: 'password'),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await SignInUser();
                        AppCommonUtils.showSnackBar(context,
                            message: "Succesfuly Signed in");
                        Navigator.pushNamed(context, ChatScreen.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          AppCommonUtils.showSnackBar(context,
                              message: "No user found for that email");
                        } else if (e.code == 'wrong-password') {
                          AppCommonUtils.showSnackBar(context,
                              message: "Wrong password provided for that user");
                        }
                      } catch (e) {
                        AppCommonUtils.showSnackBar(context,
                            message: "Opps there was an error");
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'SignIn',
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
                      onTap: () =>
                          Navigator.pushNamed(context, SignUpScreen.id),
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
        ),
      ),
    );
  }

  Future<void> SignInUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
