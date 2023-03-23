import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_management_system/src/provider/providers.dart';

DatabaseReference refs = FirebaseDatabase.instance.ref("users");

UserCredential ?credential;
Future<UserCredential?> signUptoFirebase(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    WidgetRef ref) async {
  try {
     credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    return credential;
    /*if (context.mounted) {
      if (credential.additionalUserInfo!.isNewUser == true) {
        DatabaseReference databaseReference = FirebaseDatabase.instance.ref("user/${credential.user?.uid}");
        print(
            "the onpress call is initiated..................${credential.user?.uid}");
        await databaseReference.set({
          'Name': {ref.read(textControllerProvider('signup_name'))},
          'email': {ref.read(textControllerProvider('signup_email'))},
          'mobile': {ref.read(textControllerProvider('signup_mobile'))},
          'password': {ref.read(textControllerProvider('signup_password'))},
          'owner company': {
            ref.read(textControllerProvider('signup_ownerName'))
          },
          'owner designation': {
            ref.read(textControllerProvider('signup_designation'))
          }
          //'owner name': {ref.read(textControllerProvider(''))},
        }
        ).then((value) {});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("sign up success")));
      }
    }*/
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
