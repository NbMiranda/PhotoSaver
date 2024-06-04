import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../signin/signin_page.dart';

class LoginController
{
  void login(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void signIn(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}