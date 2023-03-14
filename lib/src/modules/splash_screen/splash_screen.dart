import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_route.dart';
import '../../utils/font_style.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    _flashDuration();
    super.initState();
  }

  _flashDuration() async {
    await Future.delayed(Duration(milliseconds: 1200), () {
      //context.goNamed(AppRoute.startScreen.name);
      context.pushReplacementNamed(AppRoute.startScreen.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: -100,
                  top: -80,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.indigoAccent),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 60,
                  left: MediaQuery.of(context).size.width / 2 - 130,
                  child: Container(
                    width: 250,
                    height: 50,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        "assets/ekopii.png",
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  left: MediaQuery.of(context).size.width / 2 - 150,
                  child: Column(
                    children: [
                      // Text(
                      //   "Lorem Ipsum is a dummy text",
                      //   style: kTextStyleLato,
                      // ),
                      // Text(
                      //   "Lorem Ipsum is a dummy text",
                      //   style: kTextStyleLato,
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 90,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.8)),
                    child: Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 200,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.8)),
                    )),
                Positioned(
                  right: -100,
                  bottom: -40,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.indigoAccent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
