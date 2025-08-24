import 'package:authentication_app/routing/routes.dart';
import 'package:authentication_app/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:authentication_app/ui/auth/login/widgets/login_screen.dart';
import 'package:authentication_app/ui/auth/login/widgets/signup_screen.dart';
import 'package:authentication_app/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
        final viewmodel = LoginViewModel(authRepository: context.read());
        return LoginScreen(viewmodel: viewmodel);
        
      },
      routes: [
        GoRoute(
          path: AppRoutes.signupRelative,
          builder: (context, state) {
            return SignupScreen();
          },
        ),
      ],
    ),
  ],
);
