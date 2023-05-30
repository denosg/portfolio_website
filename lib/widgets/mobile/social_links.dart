import 'package:flutter/material.dart';
import 'dart:html' as html;

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    html.window.open(
                        "https://www.facebook.com/costelasdenis/", "_blank");
                  },
                  icon: Image.asset('facebook_blackWeb.webp')),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    html.window.open("https://github.com/denosg", "_blank");
                  },
                  icon: Image.asset('githubWeb.webp')),
            ),
            SizedBox(
              width: 50,
              height: 50,
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
    );
  }
}
