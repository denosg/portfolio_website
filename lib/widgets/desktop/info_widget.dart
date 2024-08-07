import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/photo_list.dart';

import 'package:url_launcher/url_launcher.dart' as url;

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  void openLink(String stringUrl) async {
    final openUrl = Uri.parse(stringUrl);

    if (await url.canLaunchUrl(openUrl)) {
      await url.launchUrl(openUrl);
    } else {
      throw 'Could not launch $openUrl';
    }
  }

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
            CachedNetworkImage(
                imageUrl: helloHandImgUrl, width: 30, height: 30),
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
                width: 70,
                height: 70,
                child: IconButton(
                    onPressed: () {
                      openLink("https://www.facebook.com/costelasdenis/");
                    },
                    icon: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        imageUrl: facebookImgUrl)),
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: IconButton(
                    onPressed: () {
                      openLink("https://github.com/denosg");
                    },
                    icon: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        imageUrl: githubImgUrl)),
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: IconButton(
                    onPressed: () {
                      openLink(
                          "https://www.linkedin.com/in/costelas-denis-3b1042236/");
                    },
                    icon: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        imageUrl: linkedInImgUrl)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
