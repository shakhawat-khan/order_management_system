import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/modules/home/view/home.dart';
import 'package:order_management_system/src/modules/log_in/view/log_in.dart';
import 'package:order_management_system/src/modules/sign_up/view/sign_up.dart';
import 'package:order_management_system/src/modules/sign_up_sccessful/signup_sccessful.dart';
import 'package:order_management_system/src/modules/start_screen/view/start_screen.dart';

enum AppRoute { startScreen, signUp, logIn, home, signupSuccessful }

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: AppRoute.startScreen.name,
      builder: (context, state) => const StartScreen(),
      routes: [
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
          path: 'home/:email',
          name: AppRoute.home.name,
          builder: (context, state) {
            final email = state.params['email']!;
            return HomePage(email: email);
          },
        ),
        GoRoute(
          path: 'signupSuccessful',
          name: AppRoute.signupSuccessful.name,
          builder: (context, state) => const SignupSuccessful(),
        ),
      ]),
]);
