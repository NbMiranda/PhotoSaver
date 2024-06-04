import 'package:flutter/material.dart';

import '../user/user_page.dart';

class HomeController
{
  void profile(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage()),
    );
  }
}