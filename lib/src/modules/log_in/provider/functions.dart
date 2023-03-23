import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routing/app_route.dart';
import '../../../services/share_pref.dart';

void signIntoFirebase(TextEditingController emailController,
    TextEditingController passwordController, BuildContext context) async {
  try {
    final user = FirebaseAuth.instance.currentUser;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    if (context.mounted) {
      if (user != null) {
        final test = user.email.toString();
        //final prefs = await SharedPreferences.getInstance();
        //prefs.setString("f_credential", "${credential.user?.uid}");

        PrefService _perfService = PrefService();

        _perfService.createCache('password').whenComplete(
          () {
            context.goNamed(
              AppRoute.home.name,
            );
          },
        );

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("sign up success")));
      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('No user found for that email.')));
      // print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Wrong password provided for that user.',
          ),
        ),
      );
    }
  }
}
