import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/modules/search/search_page.dart';

import '../upload/upload_image.dart';
import '../user/user_data.dart';
import '../user/user_page.dart';

class HomeController
{
  void profile(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage(index: userData.currentUserIndex)),
    );
  }

  void newPhoto(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadImage()),
    );
  }

  void listUsers(context) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchUsersPage()),
    );
  }
}