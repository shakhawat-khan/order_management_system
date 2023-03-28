import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routing/app_route.dart';
import '../../../services/share_pref.dart';
bool isSuccess=false;
Future<bool> signIntoFirebase(TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {
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


            if (user!.uid == '8CPgxNn0WiPXk1eFgSh10FkZjNJ2') {
              Fluttertoast.showToast(
                  msg: " Admin Log In success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);

              // _perfService.createCache(password)
              holdCache('admin');
            } else {
              Fluttertoast.showToast(
                msg: " User Log In success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              holdCache('user');
            }


            context.goNamed(AppRoute.home.name,);
            isSuccess =true;
            return isSuccess;
          },
        );
        return isSuccess;
        /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("sign up success")));*/
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
    isSuccess=false;
    return isSuccess;
  }
  return isSuccess;
}

holdCache(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String person = '';
  person = value;
  prefs.setString('person', person);
}
