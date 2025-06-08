import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          imageUrl.isNotEmpty
              ? ApiConstants.imageUrl(imageUrl)
              : AssetsManager.errorPoster,
      errorWidget:
          (context, url, error) => Image.network(
            AssetsManager.errorPoster,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
