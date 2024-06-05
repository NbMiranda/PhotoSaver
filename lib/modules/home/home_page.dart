import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_flutter/shared/themes/app_images.dart';
import './home_controller.dart';
import '../user/user_controller.dart';

import '../../shared/widget/post_widget.dart';
import '../../shared/widget/story_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = HomeController();
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
      bottomNavigationBar: bottomNav(context),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        'PhotoSaver',
        style: TextStyle(
          color: Color(0xFF5C0FFF),
          fontStyle: FontStyle.italic,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            userController.logout(context);
          },
          icon: Icon(Icons.logout, color: Colors.black),
        ),
      ],
    );
  }


  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      PostWidget(
                          user_name: "Neight77",
                          user_image_url: "/images/nathan.jpg",
                          post_image_url: "/images/nathan.jpg"
                        ),
                      PostWidget(
                        user_name: "luis_guilherme1996",
                        user_image_url: "/images/luis.png",
                        post_image_url: "/images/luis.png"
                      ),
                      PostWidget(
                        user_name: "m.cunha",
                        user_image_url: "/images/matheus.jpg",
                        post_image_url: "/images/matheus.jpg"
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey))
      ),
      child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
                padding: EdgeInsets.all(0),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.playCircle)),
              IconButton(
                  onPressed: () {
                    homeController.profile(context);
                  }, icon: const Icon(FontAwesomeIcons.user))

            ],
          )),
    );
  }
}
