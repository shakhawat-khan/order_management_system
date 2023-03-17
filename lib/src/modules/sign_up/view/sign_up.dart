import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/extensions/extensions.dart';
import 'package:order_management_system/src/modules/sign_up/provider/fucntions.dart';
import 'package:order_management_system/src/modules/sign_up/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';

import '../../../components/logo_ekopii.dart';
import '../../../constants/app_sizes.dart';
import '../../../provider/providers.dart';
import '../../../utils/font_style.dart';
import '../../../utils/key.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              // const LogoEkopII(
              //   height: 200,
              // ),
              // Text(
              //   'Welcome !!',
              //   style: kTextStyleLatoBold,
              // ),
              // gapH8,
              Text(
                'Full Name',
                style: kTextStylePoppinsTitel,
              ),
              gapH16,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'please enter name';
                  }
                  return null;
                },
                controller: ref.watch(textControllerProvider('signup_name')),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    hintText: 'Enter your full Name',
                    labelText: 'Name'),
              ),
              gapH20,

              Text(
                'Email',
                style: kTextStylePoppinsTitel,
              ),

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
                controller: ref.watch(
                  textControllerProvider('signup_email'),
                ),
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
                  textControllerProvider('signup_password'),
                ),
              ),

              gapH20,
              Text(
                'Mobile Number',
                style: kTextStylePoppinsTitel,
              ),

              gapH16,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'please enter Mobile number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: ref.watch(textControllerProvider('signup_mobile')),
                decoration: const InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.mobile),
                  hintText: 'Enter your Mobile Number',
                  labelText: 'Mobile Number',
                ),
              ),
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Colors.orange,
                    value: ref.watch(checkboxProvider),
                    onChanged: (value) {
                      ref.read(checkboxProvider.notifier).changeValue(value!);
                    },
                  ),
                  const Text('Are you a owner of company?')
                ],
              ),
              gapH8,

              Visibility(
                visible: ref.watch(checkboxProvider),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Company Name',
                          style: kTextStylePoppinsTitel,
                        ),
                      ],
                    ),
                    gapH16,
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'please enter Owner name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller:
                          ref.watch(textControllerProvider('signup_ownerName')),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        hintText: 'Owner Name',
                        labelText: 'Owner Name',
                      ),
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Designation',
                          style: kTextStylePoppinsTitel,
                        ),
                      ],
                    ),
                    gapH16,
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'please enter Designation';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller: ref
                          .watch(textControllerProvider('signup_designation')),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        hintText: 'Designation',
                        labelText: 'Designation',
                      ),
                    ),
                  ],
                ),
              ),

              gapH48,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration:
                            BoxDecoration(gradient: kGradientColorOrange),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            if (formKeySignup.currentState!.validate()) {
                              signUptoFirebase(
                                  ref.watch(
                                      textControllerProvider('signup_email')),
                                  ref.watch(textControllerProvider(
                                      'signup_password')),
                                  context,
                                  ref);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Please Enter Valid Information'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Registered',
                            style: kTextStyleButtonText(Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
