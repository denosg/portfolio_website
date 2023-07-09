import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class ProjectWidget extends StatefulWidget {
  final List<String> photoList;
  final String title;
  final String description;
  final String url;
  final double titleSize;
  final double descriptionSize;

  const ProjectWidget({
    super.key,
    required this.titleSize,
    required this.descriptionSize,
    required this.photoList,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  void openLink(String stringUrl) async {
    final openUrl = Uri.parse(stringUrl);

    if (await url.canLaunchUrl(openUrl)) {
      await url.launchUrl(openUrl);
    } else {
      throw 'Could not launch $openUrl';
    }
  }

  int hoveredIndex = 0;
  bool isHovered = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startSlideshow() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        hoveredIndex = (hoveredIndex + 1) % widget.photoList.length;
      });
    });
  }

  void stopSlideshow() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            openLink(widget.url);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              color: Colors.grey[300],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Stack(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: AnimatedOpacity(
                              key: ValueKey<String>(
                                  widget.photoList[hoveredIndex]),
                              opacity: 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    widget.photoList[hoveredIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHovered = true;
                                  startSlideshow();
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered = false;
                                  stopSlideshow();
                                });
                              },
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // title of project
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: widget.titleSize,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: widget.descriptionSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
