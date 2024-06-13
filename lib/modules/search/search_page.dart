import 'package:flutter/material.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import '../user/user_data.dart';
import './search_controller.dart';

class SearchUsersPage extends StatelessWidget {

  final SearchUserController searchController = SearchUserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: ListView.builder(
        itemCount: userData.users.length,
        itemBuilder: (context, index) {
          final user = userData.users[index];
          return ListTile(
            leading: CldCircularImageWidget(
              publicId: user.profilePhoto,
              width: 50,
              height: 50,
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {
              searchController.profile(context, user.index);
            },
          );
        },
      ),
    );
  }
}

class CldCircularImageWidget extends StatelessWidget {
  final String publicId;
  final double width;
  final double height;

  const CldCircularImageWidget({
    required this.publicId,
    this.width = 50,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CldImageWidget(
        publicId: publicId,
        width: width,
        height: height
      ),
    );
  }
}
