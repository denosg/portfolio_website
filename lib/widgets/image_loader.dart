// Global loading state management widget
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GlobalLoadingStateWidget extends StatefulWidget {
  const GlobalLoadingStateWidget({super.key, required this.child});

  final Widget child;

  @override
  State<GlobalLoadingStateWidget> createState() =>
      _GlobalLoadingStateWidgetState();

  static bool isAnyImageLoading(BuildContext context) {
    final state =
        context.findAncestorStateOfType<_GlobalLoadingStateWidgetState>();
    return state?._isLoading ?? false;
  }

  static void setLoadingState(BuildContext context, bool isLoading) {
    final state =
        context.findAncestorStateOfType<_GlobalLoadingStateWidgetState>();
    state?.setLoadingState(isLoading);
  }
}

class _GlobalLoadingStateWidgetState extends State<GlobalLoadingStateWidget> {
  bool _isLoading = false;

  void setLoadingState(bool isLoading) {
    setState(() => _isLoading = isLoading);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

// Widget for loading individual images
class ImageLoader extends StatefulWidget {
  const ImageLoader(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height});

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    GlobalLoadingStateWidget.setLoadingState(context, true);
  }

  @override
  void dispose() {
    GlobalLoadingStateWidget.setLoadingState(context, false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: Colors.purple,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: widget.width,
      height: widget.height,
    );
  }
}
