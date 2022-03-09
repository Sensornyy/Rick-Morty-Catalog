import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  final double height, width;

  const CacheImage({Key? key, required this.width, required this.height, required this.imageUrl})
      : super(key: key);

  Widget _imageWidget(ImageProvider imageProvider) {
    //
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      errorWidget: (context, url, error) {
        return _imageWidget(AssetImage('assets/images/error_image.png'));
      },
    );
  }
}
