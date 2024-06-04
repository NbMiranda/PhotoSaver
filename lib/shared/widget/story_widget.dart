import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  String image_url;
  StoryWidget({Key? key, required this.image_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
          clipBehavior: Clip.hardEdge,
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
            ),
          child: FittedBox(
            child: Image.asset(image_url),
            fit: BoxFit.cover,
          )),
    );
  }
}
