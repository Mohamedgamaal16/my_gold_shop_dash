import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:my_gold_dashboard/core/shared_widget/loading_indicator.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    required this.onPressed,
    required this.fit,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
  });

  final String imageUrl;
  final Function? onPressed;
  final double? height;
  final double? width;
  final BoxFit fit;

  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: imageUrl,
      height: height ?? 200,
      width: width ?? 174,
      duration: 1500,
      curve: Curves.easeIn,
      imageCache: CachedNetworkImageProvider(imageUrl),
      onPointer: true,
      debugPrint: true,
      fitAndroidIos: fit,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
      ),
      fitWeb: BoxFitWeb.cover,
      onLoading: const LoadingIndicator(height: 20),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      onTap: onPressed,
    );
  }
}
