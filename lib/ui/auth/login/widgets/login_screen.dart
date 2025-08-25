import 'package:authentication_app/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/routing/routes.dart';
import 'package:authentication_app/ui/auth/login/widgets/auth_textfield.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewmodel});
  final LoginViewModel viewmodel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'email@example.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void initState() {
    super.initState();
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewmodel.login.removeListener(_onResult);
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewmodel.login.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('this is in the login Screen');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
              ),
              AuthTextField(controller: _emailController),
              SizedBox(height: 16),
              AuthTextField(
                controller: _passwordController,
                hintText: 'Password',
                iconData: Icons.password,
              ),
              SizedBox(height: 32),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      print('button clicked');
                      widget.viewmodel.login.execute((
                        _emailController.text,
                        _passwordController.text,
                      ));

                      print(_emailController.text);
                      print(_passwordController.text);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('Don\'t have an account?'),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.signup);
                      },
                      child: Text(
                        'Register here.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewmodel.login.success) {
      widget.viewmodel.login.clearResult();
      context.go(AppRoutes.signup);
    }

    // if (widget.viewmodel.login.error) {
    //   widget.viewmodel.login.clearResult();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(AppLocalization.of(context).errorWhileLogin),
    //       action: SnackBarAction(
    //         label: AppLocalization.of(context).tryAgain,
    //         onPressed:
    //             () => widget.viewmodel.login.execute((
    //               _email.value.text,
    //               _password.value.text,
    //             )),
    //       ),
    //     ),
    //   );
    // }
  }
}
