import 'package:authentication_app/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key, required this.viewmodel});

  final LogoutViewmodel viewmodel;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.logout.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    if (widget.viewmodel.logout.isExecuting) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Its executing")),
      );
    }
  }


  //   @override
  // void initState() {
  //   super.initState();
  //   widget.viewmodel.logout.addListener(_onResult);
  // }

 


  // @override
  // void didUpdateWidget(covariant LogoutButton oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   oldWidget.viewmodel.logout.removeListener(_onResult);
  //   widget.viewmodel.logout.addListener(_onResult);
  // }

  @override
  void dispose() {
    widget.viewmodel.logout.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('this is the logout button rebuilt');
    return TextButton(
      onPressed: () {
        print('logout button tapped');
        widget.viewmodel.logout.execute();
        print(
          'logout button is executing : ${widget.viewmodel.logout.isExecuting}',
        );

        if (widget.viewmodel.logout.success) {
          print('success logout');
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
        ),
      ),
      child: Text('Logout', style: TextStyle(color: Colors.white)),
    );
  }

  // void _onResult() {}
}
