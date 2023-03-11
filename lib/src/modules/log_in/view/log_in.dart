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

class LogIn extends ConsumerWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisible = ref.watch(passwordProvider);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoEkopII(
                height: 200,
              ),
              Text(
                'Welcome !!',
                style: kTextStyleLatoBold,
              ),
              gapH8,
              const Text('Please Provide Following Details For Your account'),
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
                    hintText: 'Enter your Email',
                    prefixIcon: Icon(Icons.abc),
                    labelText: 'Email'),
                controller: ref.watch(textControllerProvider('login_email')),
              ),
              gapH8,
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
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
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKeyLogin.currentState!.validate()) {
                          signIntoFirebase(
                              ref.watch(textControllerProvider('login_email')),
                              ref.watch(
                                  textControllerProvider('login_password')),
                              context);
                        } else {
                          //print(user);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please Enter Valid Information')),
                          );
                        }
                      },
                      child: const Text('Get Login'),
                    ),
                  ),
                ],
              ),
              gapH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed(AppRoute.signUp.name);
                      },
                      child: const Text('Create Account'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
