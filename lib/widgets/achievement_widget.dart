import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AchievementWidget extends StatelessWidget {
  final String title;
  final String url;
  final List<String> photoUrls;
  final bool isForDesk;
  const AchievementWidget(
      {super.key,
      required this.title,
      required this.url,
      required this.photoUrls,
      required this.isForDesk});

  void openLink(String stringUrl) async {
    final openUrl = Uri.parse(stringUrl);

    if (await canLaunchUrl(openUrl)) {
      await launchUrl(openUrl);
    } else {
      throw 'Could not launch $openUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final width = isForDesk ? null : deviceSize.width * 0.7;
    final height = isForDesk ? deviceSize.height * 0.4 : null;

    return Column(
      children: [
        // white space
        SizedBox(height: deviceSize.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_right_rounded, color: Colors.purple),
            Expanded(
                child: Text(title,
                    style: TextStyle(fontSize: isForDesk ? 20 : 15))),
            IconButton(
              icon: const Icon(Icons.link),
              color: Colors.purple,
              onPressed: () => openLink(url),
            ),
          ],
        ),
        SizedBox(height: deviceSize.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: photoUrls
              .map((photoUrl) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: photoUrl,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                                color: Colors.purple)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: width,
                        height: height,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
