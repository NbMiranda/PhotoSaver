import 'package:flutter/material.dart';

import '../login/login_page.dart';

class LoginController
{
  void login(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}