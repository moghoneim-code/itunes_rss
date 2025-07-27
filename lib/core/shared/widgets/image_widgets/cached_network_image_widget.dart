import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final bool isRounded;
  final bool isElevated;

  const CachedNetworkImageWidget({
    super.key,
    required this.height,
    required this.width,
    required this.isRounded,
    required this.isElevated,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = isRounded ? BorderRadius.circular(12.0) : BorderRadius.zero;

    Widget imageContainer(ImageProvider imageProvider) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image(
          image: imageProvider,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      filterQuality: FilterQuality.high,
      fadeInDuration: const Duration(milliseconds: 200),
      imageBuilder: (context, imageProvider) {
        return isElevated
            ? Material(
          elevation: 12,
          borderRadius: borderRadius,
          child: imageContainer(imageProvider),
        )
            : imageContainer(imageProvider);
      },
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[700]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: const Color(0xFF2E2E2E),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
