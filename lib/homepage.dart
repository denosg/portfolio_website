import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/providers/click_counter_prov.dart';
import './responsive/Widgets/desktopBody.dart';
import './responsive/Widgets/mobileBody.dart';
import './responsive/responsive_layout.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickProv = ref.read(clickCounterProv.notifier);
    return Scaffold(
      body: InkWell(
        onTap: () {
          clickProv.addClick();
          print('da');
        },
        child: ResponsiveLayout(
          mobileBody: MobileBody(),
          desktopBody: DesktopBody(),
        ),
      ),
    );
  }
}
