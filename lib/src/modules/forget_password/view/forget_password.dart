import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/utils/font_style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            gapH16,
            Column(
              children: [
                Text(
                  'Enter the Email address associated ',
                  style: kTextButtonColorBlue,
                ),
                Text(
                  'with your account',
                  style: kTextButtonColorBlue,
                ),
              ],
            ),
            gapH20,
            Text(
              'We will email you a verification code to your email address',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
            gapH20,
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your email', labelText: 'Email'),
            ),
            gapH32,
            DecoratedBox(
              decoration: BoxDecoration(gradient: kGradientColorBlue),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    'Send Email',
                    style: kTextStyleButtonText(Colors.white),
                  ),
                ),
              ),
            ),
            gapH48,
            Text('Enter the 4 digit security code & your'),
            Text('email account will be verified'),
            gapH24,
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                gapW24,
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                gapW24,
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                gapW24,
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {}
                    },
                  ),
                ),
              ],
            ),
            gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t Receive your code! '),
                TextButton(
                  onPressed: () {},
                  child: Text('Resend'),
                )
              ],
            ),
            gapH24,
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: kGradientColorBlue),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Verifiey',
                    style: kTextStyleButtonText(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
