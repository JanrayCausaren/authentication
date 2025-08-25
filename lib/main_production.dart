import 'package:authentication_app/app.dart';
import 'package:authentication_app/config/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///for production
///

void main() {
  runApp(MultiProvider(providers: providersRemote, child: MyApp()));
}
