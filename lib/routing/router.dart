import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration_remote.dart';
import 'package:authentication_app/routing/routes.dart';
import 'package:authentication_app/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:authentication_app/ui/auth/login/view_models/registration_viewmodel.dart';
import 'package:authentication_app/ui/auth/login/widgets/login_screen.dart';
import 'package:authentication_app/ui/auth/login/widgets/signup_screen.dart';
import 'package:authentication_app/ui/home/widgets/home_screen.dart';
import 'package:authentication_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///Entry point
///listen for changes in the authrepository to redirect the the user
/// to /login page when user tend to logout
GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: AppRoutes.splashScreen,
  debugLogDiagnostics: true,
  refreshListenable: authRepository,
  redirect: _redirect,

  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        final viewmodel = LoginViewModel(authRepository: context.read());
        return LoginScreen(viewmodel: viewmodel);
      },
      routes: [
        GoRoute(
          path: AppRoutes.signupRelative,
          builder: (context, state) {
            final viewmodel = RegistrationViewmodel(
              registrationRepository: context.read(),
            );
            return SignupScreen(viewmodel: viewmodel);
          },
        ),
      ],
    ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final authRepo = context.read<AuthRepository>();
  final authenticated = await authRepo
      .isAuthenticated; // it have function of load from secure storage
  final isLoaded =  authRepo.isLoaded;
  final loggingIn = state.matchedLocation.startsWith(AppRoutes.login);

  // // Still loading → stay on splash
  // if (!isLoaded) {
  //   print('the token is loading $isLoaded');
  //   print('send to splash screen');
  //   return AppRoutes.splashScreen;
  // } else if (!authenticated && !loggingIn) {
  //   // If the user is not logged in but is trying to go somewhere else → send to login
  //   print('proceed to login screen');
  //   return AppRoutes.login;
  // } else if (authenticated && isLoaded) {
  //   // If user is logged in but still on the login page → go to home
  //   print('proceed to home screen');
  //   return AppRoutes.home;
  // }

  return null;
}
