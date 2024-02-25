import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages_chat_app/common/consts.dart';
import 'package:messages_chat_app/common/custom_button.dart';
import 'package:messages_chat_app/common/custom_text_field.dart';
import 'package:messages_chat_app/common/utils/common_utils.dart';
import 'package:messages_chat_app/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static String id = 'SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        
                      });
                      try {
                      await registerUser();
                      AppCommonUtils.showSnackBar(
                      context,
                      message: "succesfuly Signed Up",
                    );
                    Navigator.pushNamed(context, ChatScreen.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        AppCommonUtils.showSnackBar(
                          context,
                          message: "The password provided is too weak",
                        );
                      } else if (e.code == 'email-already-in-use') {
                        AppCommonUtils.showSnackBar(
                          context,
                          message: "The account already exists for that email",
                        );
                      }
                    } catch (e) {
                      AppCommonUtils.showSnackBar(context, message: "Opps there was an error"); 
                    }
                    isLoading = false;
                    setState(() {
                      
                    });
                    } else {}
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
        ),
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
