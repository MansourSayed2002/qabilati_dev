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
      errorWidget: (context, url, error) {
        return Image.asset(ImageApp.user, fit: BoxFit.cover);
      },
    );
  }
}

// class ImageProfileWidget extends StatelessWidget {
//   const ImageProfileWidget({
//     super.key,
//     this.width,
//     this.height,
//     required this.future,
//   });
//   final double? width;
//   final double? height;
//   final Future<String>? future;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(color: ColorApp.coral);
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           return NetWorkImageWidget(
//             image: snapshot.data!,
//             height: height ?? 50.0.h,
//             width: width ?? 50.0.w,
//           );
//         }
//       },
//     );
//   }
// }
