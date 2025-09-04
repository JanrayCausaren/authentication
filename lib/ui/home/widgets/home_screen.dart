import 'package:authentication_app/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:authentication_app/ui/auth/logout/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.logoutViewmodel});

  final LogoutViewmodel logoutViewmodel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 32,
        actionsPadding: const EdgeInsetsGeometry.only(right: 16),
        titleSpacing: 0,
        title: const Text('Google Class'),
        actions: [
          IconButton(
            // iconSize: 16,
            onPressed: () {},
            icon: CircleAvatar(
              maxRadius: 16,
              backgroundColor: const Color.fromARGB(255, 123, 212, 126),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Navigation Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Center(child: Text('Home Content'))],
            ),
          ],
        ),
      ),
    );
  }
}
