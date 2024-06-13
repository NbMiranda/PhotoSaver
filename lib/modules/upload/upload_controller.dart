import 'package:flutter/material.dart';

import '../home/home_page.dart'

class UserController {
  void homePage(BuildContext context) async {

     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
