import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/log_in/provider/functions.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/font_style.dart';
import 'package:order_management_system/src/utils/key.dart';

import '../../../components/logo_ekopii.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/app_colors.dart';

class LogIn extends ConsumerWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisible = ref.watch(passwordProvider);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),//AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 65,),
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
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff354CD8)
                    )
                  ),
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
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Color(0xff354CD8)
                      )
                  ),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password!',
                    style: kTextColorOrange,
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
                                    content: Text(
                                        'Please Enter Valid Information')),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Flexible(
              //       child: SizedBox(
              //         height: 50,
              //         width: MediaQuery.of(context).size.width,
              //         child: DecoratedBox(
              //           decoration: BoxDecoration(gradient: kGradientColorBlue),
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.transparent,
              //             ),
              //             onPressed: () {
              //               context.goNamed(AppRoute.signUp.name);
              //             },
              //             child: const Text(
              //               'Create Account',
              //               style: TextStyle(color: Colors.white),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )

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
                  onPressed: () {},
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
    );
  }
}
