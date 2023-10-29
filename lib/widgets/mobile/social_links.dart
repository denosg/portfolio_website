import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

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
                    openLink("https://www.facebook.com/costelasdenis/");
                  },
                  icon: CachedNetworkImage(
                      imageUrl:
                          'https://i.ibb.co/c3xmLvF/facebook-black-Web.webp')),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    openLink("https://github.com/denosg");
                  },
                  icon: CachedNetworkImage(
                      imageUrl: 'https://i.ibb.co/478nzgJ/github-Web.webp')),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    openLink(
                        "https://www.linkedin.com/in/costelas-denis-3b1042236/");
                  },
                  icon: CachedNetworkImage(
                      imageUrl: 'https://i.ibb.co/WWSR3Kx/linkedin-Web.webp')),
            ),
          ],
        ),
      ),
    );
  }
}
