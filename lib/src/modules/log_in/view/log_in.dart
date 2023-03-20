import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/log_in/provider/functions.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/font_style.dart';
import 'package:order_management_system/src/utils/key.dart';

import '../../../components/logo_ekopii.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nav_utils.dart';
import '../../sign_up/view/sign_up.dart';

class LogIn extends ConsumerWidget {
  const LogIn({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisible = ref.watch(passwordProvider);
    return Scaffold(
      backgroundColor:Colors.transparent,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title: Text(
          'Login',
          style:  GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appbackGroundgradent
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: appbackGroundgradent
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Form(
              key: formKeyLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const LogoEkopII(
                  //   height: 200,
                  // ),
                  SizedBox(height: 20,),
                  Text(
                    'Email Address',
                    style: kTextStylePoppinsTitel,
                  ),

                  //const Text('Please Provide Following Details For Your account'),
                  gapH16,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmail != true) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,

                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.inputBorderColor,
                            width: 0.5,
                          ),
                        ),
                      fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter your Email',
                        prefixIcon: Icon(Icons.abc),
                        labelText: 'Email'),
                    controller: ref.watch(textControllerProvider('login_email')),
                  ),
                  gapH20,
                  Text(
                    'Password',
                    style: kTextStylePoppinsTitel,
                  ),
                  gapH16,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'password must be 8 character or more';
                      }

                      return null;
                    },
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputBorderColor,
                          width: 0.5,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          ref
                              .read(passwordProvider.notifier)
                              .visible(!passwordVisible);
                        },
                      ),
                      hintText: 'Enter your Password',
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Password',
                    ),
                    controller: ref.watch(
                      textControllerProvider('login_password'),
                    ),
                  ),
                  gapH20,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Theme(
                        data: ThemeData(
                          primarySwatch: Colors.blue,
                          unselectedWidgetColor: AppColors.defaultColor,
                        ),
                        child: Checkbox(

                          activeColor: Colors.orange,
                          onChanged: (value) {
                          },
                          value: false,

                        ),
                      ),
                      Text(
                        'Stay with us',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300,color: Colors.black.withOpacity(0.4)),
                      ),

                      Spacer(),

                      TextButton(
                        onPressed: () {
                          context.goNamed(AppRoute.forgetPassword.name);
                        },
                        child: Text(
                          'Forgot Password!',
                          style: kTextColorOrange,
                        ),
                      )
                    ],
                  ),

                  gapH20,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: DecoratedBox(
                            decoration:
                            BoxDecoration(gradient: kGradientColorBlue),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                if (formKeyLogin.currentState!.validate()) {
                                  signIntoFirebase(
                                      ref.watch(
                                          textControllerProvider('login_email')),
                                      ref.watch(textControllerProvider(
                                          'login_password')),
                                      context);
                                } else {
                                  //print(user);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please Enter Valid Information')),
                                  );
                                }
                              },
                              child: Text(
                                'Log In',
                                style: kTextStyleButtonText(Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'If You Are A New User Do It First',
                      ),
                    ],
                  ),

                  gapH20,

                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.orange),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        NavUtils.push(context, SignUp());
                      },
                      child: Text(
                        'Registered Now',
                        style: kTextStyleButtonText(Colors.orange),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
