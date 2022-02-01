import 'package:diynner_alt/app_controller.dart';
import 'package:diynner_alt/login_page.dart';
import 'package:flutter/material.dart';

import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'DIYnner',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => MyHomePage(
                  title: 'DIYnner',
                ),
          },
        );
      },
    );
  }
}
