import 'package:flutter/material.dart';

import '../upload/upload_image.dart';
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

  void newPhoto(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadImage()),
    );
  }
}