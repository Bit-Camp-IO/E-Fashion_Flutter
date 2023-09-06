import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlurredBackgroundImage extends StatelessWidget {
  const BlurredBackgroundImage(
      {super.key, required this.imagePath, required this.isLocalImage});

  final String imagePath;
  final bool isLocalImage;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
      child: SizedBox.expand(
        child: isLocalImage
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
