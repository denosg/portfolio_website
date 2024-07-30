import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        const Divider(),
        SizedBox(height: deviceSize.height * 0.025),
        const Center(
          child: Text('Created by Costelas Denis <3'),
        ),
        SizedBox(height: deviceSize.height * 0.025),
      ],
    );
  }
}
