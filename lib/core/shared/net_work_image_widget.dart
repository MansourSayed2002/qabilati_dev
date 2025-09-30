import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qabilati/core/constants/image_app.dart';

class NetWorkImageWidget extends StatelessWidget {
  const NetWorkImageWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width ?? double.infinity,
      placeholder:
          (context, url) => Container(
            height: height,
            width: width ?? double.infinity,
            color: Colors.grey[200], 
            alignment: Alignment.center,
            child: const Icon(Icons.image, color: Colors.grey),
          ),
      errorWidget: (context, url, error) {
        return Container(
          color: Colors.grey[200],
          child: Image.asset(ImageApp.user, fit: BoxFit.cover),
        );
      },
    );
  }
}
