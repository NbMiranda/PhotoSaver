import 'package:flutter/material.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import '../home/home_page.dart';
import 'user_data.dart';

class UserPage extends StatelessWidget {
  final int index;

  UserPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final currentUser = userData.users[index];

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentUser.name),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navegar para a tela de edição do perfil
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CldImageWidget(
                      publicId: currentUser.profilePhoto,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          currentUser.email,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: (currentUser.photos.length / 3).ceil(),
                itemBuilder: (context, index) {
                  int startIndex = index * 3;
                  int endIndex = startIndex + 3;
                  if (endIndex > currentUser.photos.length) {
                    endIndex = currentUser.photos.length;
                  }

                  List<Map<String, dynamic>> photos = currentUser.photos.sublist(startIndex, endIndex);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: photos.map((photo) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: CldImageWidget(
                              publicId: photo['url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
