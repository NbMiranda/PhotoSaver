import 'package:flutter/material.dart';

import '../login/login_page.dart';

class SplashController
{
  void load(context) async
  {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}