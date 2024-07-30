import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/photo_list.dart';
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
              width: 70,
              height: 70,
              child: IconButton(
                  onPressed: () {
                    openLink("https://www.facebook.com/costelasdenis/");
                  },
                  icon: CachedNetworkImage(imageUrl: facebookImgUrl)),
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                  onPressed: () {
                    openLink("https://github.com/denosg");
                  },
                  icon: CachedNetworkImage(imageUrl: githubImgUrl)),
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                  onPressed: () {
                    openLink(
                        "https://www.linkedin.com/in/costelas-denis-3b1042236/");
                  },
                  icon: CachedNetworkImage(imageUrl: linkedInImgUrl)),
            ),
          ],
        ),
      ),
    );
  }
}
