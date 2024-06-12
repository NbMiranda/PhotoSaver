import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/modules/login/login_page.dart';
import 'package:instagram_clone_flutter/modules/splash/splash_controller.dart';
import 'package:instagram_clone_flutter/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = SplashController();
    controller.load(context);

    return Stack(
      children: [
        Center(
          child: CldImageWidget(
            publicId: AppImages.logo,
        )),
      ],
    );
  }
}
