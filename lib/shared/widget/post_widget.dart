import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatelessWidget {
  String user_image_url;
  String user_name;
  String post_image_url;

  PostWidget(
      {Key? key,
      required this.user_name,
      required this.user_image_url,
      required this.post_image_url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 24,
                  width: 24,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24),
                  ),
                  child: FittedBox(
                    child: Image.asset(this.user_image_url),
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  this.user_name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Icon(Icons.more_vert_outlined)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Image.asset(this.post_image_url),
          ),
          Row(children: [
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.heart)),
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.comment)),
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.paperPlane)),
            Expanded(child: Container(),),
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.bookmark))
          ],)
        ],
      ),
    );
  }
}
