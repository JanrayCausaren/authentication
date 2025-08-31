import 'package:authentication_app/ui/auth/login/view_models/registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/routing/routes.dart';
import 'package:authentication_app/ui/auth/login/widgets/auth_textfield.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.viewmodel});

  final RegistrationViewmodel viewmodel;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('this is in the signup screen');
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
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
              ),
              AuthTextField(controller: _emailController),
              SizedBox(height: 16),
              AuthTextField(
                controller: _passwordController,
                hintText: 'Password',
                iconData: Icons.password,
              ),
              SizedBox(height: 16),
              AuthTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm password',
                iconData: Icons.lock,
              ),
              SizedBox(height: 32),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      print('sign up button clicked');
                      widget.viewmodel.signup.execute((
                        _emailController.text,
                        _passwordController.text,
                      ));

                      print('the view is executing: ${widget.viewmodel.signup.isExecuting}');
                      context.go(AppRoutes.login);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    child: widget.viewmodel.signup.isExecuting
                        ? CircularProgressIndicator()
                        : Text('Login', style: TextStyle(color: Colors.white)),
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
                      child: Text('Already have an account?'),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.login);
                      },
                      child: Text(
                        'Login here.',
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
}
