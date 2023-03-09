import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/extensions/extensions.dart';

import '../../../components/logo_ekopii.dart';
import '../../../constants/app_sizes.dart';
import '../../../provider/providers.dart';
import '../../../routing/app_route.dart';
import '../../../utils/font_style.dart';
import '../../../utils/key.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisible = ref.watch(passwordProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKeySignup,
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
                controller: ref.watch(textControllerProvider('email')),
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
                  textControllerProvider('password'),
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
                        if (formKeySignup.currentState!.validate()) {
                          context.goNamed(AppRoute.signupSuccessful.name);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please Enter Valid Information')),
                          );
                        }
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
