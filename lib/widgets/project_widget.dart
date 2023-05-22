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
    timer = Timer.periodic(Duration(seconds: 1), (_) {
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
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AnimatedOpacity(
                key: ValueKey<String>(widget.photoList[hoveredIndex]),
                opacity: 1.0,
                duration: Duration(milliseconds: 300),
                child: Image.asset(
                  widget.photoList[hoveredIndex],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
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
    );
  }
}
