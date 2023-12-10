import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final shimmerHeight = height ?? 200;
    final shimmerWidth = width ?? 150;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(15),
        height: shimmerWidth,
        width: shimmerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
      ),
    );
  }
}
