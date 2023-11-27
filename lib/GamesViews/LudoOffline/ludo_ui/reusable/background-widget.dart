import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final String? imagePath;
  final bool? isLogo;

  const BackgroundImageWidget({
    Key? key,
    this.imagePath,
    this.isLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ludoOffline/ludo/Ludo background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                // "assets/ludoOffline/ludo/RectangleBg.png",
                "assets/common/skhewatiLudo.png",
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        isLogo != false
            ? Image.asset(
                "assets/ludoOffline/ludo/Ludologo.png",
                height: 200,
                width: 200,
                alignment: Alignment.center,
              )
            : const SizedBox()
      ],
    );
  }
}
