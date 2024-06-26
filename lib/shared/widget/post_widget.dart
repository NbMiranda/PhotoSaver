import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/asset/cld_image.dart';
import 'package:instagram_clone_flutter/modules/user/user_data.dart';

import '../../modules/user/user_page.dart';

class PostWidget extends StatefulWidget {
  final String userImageUrl;
  final String userName;
  final int userIndex;
  final String postImageUrl;

  const PostWidget({
    Key? key,
    required this.userName,
    required this.userImageUrl,
    required this.userIndex,
    required this.postImageUrl,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserPage(index: widget.userIndex)),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24),
                  ),
                  child: FittedBox(
                    child: CldImageWidget(
                      publicId: widget.userImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage(index: widget.userIndex)),
                      );
                    },
                    child: Text(
                      widget.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                const Icon(Icons.more_vert_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: CldImageWidget(
              publicId: widget.postImageUrl,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  color: isLiked ? Colors.red : Colors.black,
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(FontAwesomeIcons.comment),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
