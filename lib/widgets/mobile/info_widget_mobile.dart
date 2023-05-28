import 'package:flutter/material.dart';
import 'dart:html' as html;

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
        SizedBox(
          width: 120,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                    onPressed: () {
                      html.window.open(
                          "https://www.facebook.com/costelasdenis/", "_blank");
                    },
                    icon: Image.asset('facebook_blackWeb.webp')),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                    onPressed: () {
                      html.window.open("https://github.com/denosg", "_blank");
                    },
                    icon: Image.asset('githubWeb.webp')),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                    onPressed: () {
                      html.window.open(
                          "https://www.linkedin.com/in/costelas-denis-3b1042236/",
                          "_blank");
                    },
                    icon: Image.asset('linkedinWeb.webp')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}