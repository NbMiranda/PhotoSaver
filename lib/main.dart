import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/modules/splash/splash_page.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

void main() {
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'dcaufvn3n');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

