import 'package:flutter/material.dart';
import '../user/user_page.dart';


class SearchUserController
{
  void profile(context, index) async
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage(index: index)),
    );
  }
}