import 'package:flutter/material.dart';
import 'package:authentication_app/app.dart';
import 'package:authentication_app/config/dependencies.dart';
import 'package:provider/provider.dart';

//for development config

void main() {
  runApp(MultiProvider(providers: providersLocal, child: MyApp()));
}
