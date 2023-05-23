import 'dart:async';

import 'package:flutter/material.dart';

class ProjectWidget extends StatefulWidget {
  final List<String> photoList;

  const ProjectWidget({required this.photoList});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
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
    return GestureDetector(
      onTap: () {
        // Handle onTap event if needed
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          color: Colors.grey[300],
          child: SizedBox(
            width: 400,
            height: 450,
            child: Center(
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedOpacity(
                      key: ValueKey<String>(widget.photoList[hoveredIndex]),
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            widget.photoList[hoveredIndex],
                            width: 300,
                            height: 350,
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
        ),
      ),
    );
  }
}
