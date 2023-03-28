import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:order_management_system/src/modules/home/view/home.dart';
import 'package:order_management_system/src/modules/log_in/view/log_in.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:order_management_system/src/utils/nav_utils.dart';

import '../../routing/app_route.dart';
import '../../services/share_pref.dart';
import '../../utils/font_style.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: Duration(microseconds: 100));
    _animationController.forward();

    _flashDuration();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late final AnimationController _animationController;
  _flashDuration() async {
    await Future.delayed(Duration(milliseconds: 1000), () {

      setState(() {
        visiboel=false;
        _Navigaton();
      });




    });
  }

  _Navigaton()async{
   await  Future.delayed(Duration(milliseconds: 1500),(){
      setState(() {
        final PrefService _prefService = PrefService();

        //context.goNamed(AppRoute.startScreen.name);

        _prefService.readCache("password").then((value) {
          print(value);
          if (value != null) {
            print('if');
            return context.pushReplacementNamed(AppRoute.home.name);
          } else {
            return context.pushReplacementNamed(AppRoute.logIn.name);
          }

          //context.pushReplacementNamed(AppRoute.startScreen.name);
        });
      });
    });
  }

  bool visiboel=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: visiboel==true?Colors.white:Colors.red,
          gradient: visiboel==false?LinearGradient(
            colors: [
              AppColors.bottomNavigationBackgrundStart,
              AppColors.bottomNavigationBackgrundEnd
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ):bottomNavigationBackgroundGradientfakse
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Stack(
          alignment: Alignment.center,

          children: [


            visiboel==false? Positioned(
              top: MediaQuery.of(context).size.height/2+30,
                child: Center(child: Text("Crafter",style: GoogleFonts.fasthand(fontSize: 28, fontWeight: FontWeight.w500,color: Colors.white),)),
            ):SizedBox(),
            Positioned(
              top: MediaQuery.of(context).size.height/2+20,

                child: Visibility(
                    visible: visiboel,
                    child: Image.asset("assets/ic-circule.png",fit: BoxFit.contain,))),
            Lottie.asset("assets/logo-lotti.json", width: 60,height:60,filterQuality:FilterQuality.high,fit: BoxFit.fitWidth,repeat: false,),




          ],
        ),
      )),
    );

    /* Scaffold(
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
                      child: Image.asset("assets/ekopii.png",),
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
    );*/
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Splash extends StatelessWidget {
//   const Splash({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Image.asset('assets/box.png'),
//           Image.asset('assets/oval.png'),
//         ],
//       ),
//     );
//   }
// }
