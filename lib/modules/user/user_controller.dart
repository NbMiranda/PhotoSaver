import 'package:flutter/material.dart';

import '../login/login_page.dart';
import './user_data.dart';

class UserController {
  void logout(BuildContext context) async {
    userData.currentUserIndex = -1; 

     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
