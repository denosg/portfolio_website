import 'package:flutter/material.dart';

class InfoWidgetMobile extends StatelessWidget {
  const InfoWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name text
        Text("Costelas", style: TextStyle(fontSize: 25)),
        SizedBox(height: 5),
        Text("Denis",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 3),
        Row(
          children: [
            Icon(Icons.arrow_right_rounded, color: Colors.deepPurple),
            Text("Flutter Developer")
          ],
        ),
        // social links
        SizedBox(height: 10),
      ],
    );
  }
}
