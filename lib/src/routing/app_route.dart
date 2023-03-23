import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/modules/forget_password/view/forget_password.dart';
import 'package:order_management_system/src/modules/home/view/home.dart';
import 'package:order_management_system/src/modules/log_in/view/log_in.dart';
import 'package:order_management_system/src/modules/sign_up/view/sign_up.dart';
import 'package:order_management_system/src/modules/sign_up_sccessful/signup_sccessful.dart';
import 'package:order_management_system/src/modules/splash_screen/splash_screen.dart';
import 'package:order_management_system/src/modules/start_screen/view/start_screen.dart';

import '../modules/all_order_list/order_list.dart';
import '../modules/home/view/root-navigation.dart';
import '../modules/order/view/add_order.dart';

enum AppRoute {
  splash,
  signUp,
  logIn,
  home,
  signupSuccessful,
  order,
  orderList,
  forgetPassword
}

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => const Splash(),
      routes: [
        // GoRoute(
        //     path: 'start',
        //     name: AppRoute.startScreen.name,
        //     builder: (context, state) => StartScreen(),
        //     routes: []),
        GoRoute(
          path: 'forget_password',
          name: AppRoute.forgetPassword.name,
          builder: (context, state) => const ForgetPassword(),
        ),
        GoRoute(
          path: 'sign_up',
          name: AppRoute.signUp.name,
          builder: (context, state) => const SignUp(),
        ),
        GoRoute(
          path: 'log_in',
          name: AppRoute.logIn.name,
          builder: (context, state) => const LogIn(),
        ),
        GoRoute(
          path: 'home',
          name: AppRoute.home.name,
          builder: (context, state) {
            //final email = state.params['email']!;
            return RootNavigation(
              email: '',
            );
          },
        ),
        GoRoute(
          path: 'signupSuccessful',
          name: AppRoute.signupSuccessful.name,
          builder: (context, state) => const SignupSuccessful(),
        ),
        GoRoute(
            path: 'order',
            name: AppRoute.order.name,
            builder: (context, state) => const OrderPage(),
            routes: [
              GoRoute(
                path: 'order_list',
                name: AppRoute.orderList.name,
                builder: (context, state) => const OrderList(),
              ),
            ]),
      ]),
]);
