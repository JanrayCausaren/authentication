import 'package:authentication_app/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:authentication_app/ui/auth/logout/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.logoutViewmodel});

  final LogoutViewmodel logoutViewmodel;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Welcome Home'),
              Text('Hello User'),
              SizedBox(height: 40),
              LogoutButton(viewmodel: logoutViewmodel),
            ],
          ),
        ),
      ),
    );
  }
}
