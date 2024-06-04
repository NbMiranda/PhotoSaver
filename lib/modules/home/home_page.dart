import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_flutter/shared/themes/app_images.dart';
import './home_controller.dart';

import '../../shared/widget/post_widget.dart';
import '../../shared/widget/story_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
      bottomNavigationBar: bottomNav(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      // title: Image.asset(AppImages.textLogo),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            FontAwesomeIcons.plusSquare,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            FontAwesomeIcons.facebookMessenger,
            color: Colors.black,
          ),
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
                Row(
                  children: [
                    StoryWidget(image_url: "/images/nathan.jpg"),
                    StoryWidget(image_url: "/images/luis.png"),
                    StoryWidget(image_url: "/images/matheus.jpg")
                  ],
                ),
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
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart)),
              IconButton(
                  onPressed: () {
                    controller.profile(context);
                  }, icon: const Icon(FontAwesomeIcons.user))

            ],
          )),
    );
  }
}
