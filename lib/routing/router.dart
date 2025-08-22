import 'package:flutter_app_template/routing/routes.dart';
import 'package:flutter_app_template/ui/auth/login/widgets/login_screen.dart';
import 'package:flutter_app_template/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppRoutes.login,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return LoginScreen();
      },  
    ),
  ],
);
