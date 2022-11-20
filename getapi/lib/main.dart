import 'package:flutter/material.dart';

import 'package:getapi/Screen/profile_update.dart';
import 'package:getapi/screens2/dashboard.dart';
import 'package:getapi/screens2/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MartverseLoginScreen.id,
        routes: {
          DashboardRed.id: (context) => const DashboardRed(),
          ProfileUpdate.id: (context) => const ProfileUpdate(),
          MartverseLoginScreen.id: (context) => const MartverseLoginScreen(),
        });
  }
}
