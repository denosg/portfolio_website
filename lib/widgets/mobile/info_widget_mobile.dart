import 'package:flutter/material.dart';

class InfoWidgetMobile extends StatelessWidget {
  const InfoWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name text
        const Text("Costelas", style: TextStyle(fontSize: 25)),
        const SizedBox(height: 5),
        const Text("Denis",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 3),
        Row(
          children: const [
            Icon(Icons.arrow_right_rounded, color: Colors.deepPurple),
            Text("Flutter Developer")
          ],
        ),
        // social links
        const SizedBox(height: 10),
      ],
    );
  }
}
