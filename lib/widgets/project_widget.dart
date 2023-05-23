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
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Card(
          elevation: 4,
          color: Colors.grey[300],
          child: SizedBox(
            width: 350,
            height: 300,
            child: Center(
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
                        width: 300,
                        height: 250,
                        fit: BoxFit.fitHeight,
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
