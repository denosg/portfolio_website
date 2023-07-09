import 'package:flutter/material.dart';
import 'dart:html' as html;

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

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
            Image.network('https://i.ibb.co/tMcyKSG/hello-hand-emoji-web.webp',
                width: 30, height: 30),
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
        const Row(
          children: [
            Icon(Icons.arrow_right_rounded, color: Colors.deepPurple),
            Text("Flutter Developer")
          ],
        ),
        // social links
        const SizedBox(height: 10),
        SizedBox(
          width: 300,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                    onPressed: () {
                      html.window.open(
                          "https://www.facebook.com/costelasdenis/", "_blank");
                    },
                    icon: Image.network(
                        'https://i.ibb.co/c3xmLvF/facebook-black-Web.webp')),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                    onPressed: () {
                      html.window.open("https://github.com/denosg", "_blank");
                    },
                    icon: Image.network(
                        'https://i.ibb.co/478nzgJ/github-Web.webp')),
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
                    icon: Image.network(
                        'https://i.ibb.co/WWSR3Kx/linkedin-Web.webp')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
