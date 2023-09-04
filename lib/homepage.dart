import 'package:flutter/material.dart';
import './responsive/Widgets/desktopBody.dart';
import './responsive/Widgets/mobileBody.dart';
import './responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
