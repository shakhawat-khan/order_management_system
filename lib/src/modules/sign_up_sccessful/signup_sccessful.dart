import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/font_style.dart';

class SignupSuccessful extends StatelessWidget {
  const SignupSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' Congratulation !!  ',
              style: kTextStyleLato,
            ),
            const Text('Account sccessfully created'),
            gapH16,
            ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoute.logIn.name);
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
