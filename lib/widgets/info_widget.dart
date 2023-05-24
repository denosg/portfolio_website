import 'package:flutter/material.dart';
import 'dart:html' as html;

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // welcome text + hello emoji hand
        Row(
          children: [
            const Text("Welcome to my portfolio!",
                style: TextStyle(fontSize: 40)),
            const SizedBox(width: 5),
            Image.asset('hello_hand_emoji_web.webp', width: 30, height: 30),
          ],
        ),
        const SizedBox(height: 20),
        // name text
        const Text("Costelas", style: TextStyle(fontSize: 45)),
        const SizedBox(height: 5),
        const Text("Denis",
            style: TextStyle(
              fontSize: 45,
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
        Container(
          width: 300,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                child: IconButton(
                    onPressed: () {
                      html.window.open(
                          "https://www.facebook.com/costelasdenis/", "_blank");
                    },
                    icon: Image.asset('facebook_blackWeb.webp')),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                    onPressed: () {
                      html.window.open("https://github.com/denosg", "_blank");
                    },
                    icon: Image.asset('githubWeb.webp')),
              ),
              SizedBox(
                width: 60,
                height: 60,
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
