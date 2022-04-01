import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appstore/login_page.dart';

void main() {
  runApp(appStore());
}

class appStore extends StatelessWidget {
  const appStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
