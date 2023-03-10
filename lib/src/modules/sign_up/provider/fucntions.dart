import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_route.dart';

void signUptoFirebase(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (context.mounted) {
      if (credential.additionalUserInfo!.isNewUser == true) {
        context.goNamed(AppRoute.signupSuccessful.name);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("sign up success")));
      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The password provided is too weak")));

      // print('.');
    } else if (e.code == 'email-already-in-use') {
      //print('The account already exists for that email.');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("The account already exists for that email.")));
    }
  } catch (e) {
    print(e);
  }
}
