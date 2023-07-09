import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class CustomDrawer extends StatelessWidget {
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;

  const CustomDrawer(
      {super.key,
      required this.homeKey,
      required this.aboutKey,
      required this.projectsKey});

  void downloadResume() async {
    final resumeUrl = Uri.parse(
        'https://github.com/denosg/resume-host/blob/main/CV%20Denis%20Costelas.pdf');

    if (await url.canLaunchUrl(resumeUrl)) {
      await url.launchUrl(resumeUrl);
    } else {
      throw 'Could not launch $resumeUrl';
    }
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Hello !',
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              scrollTo(homeKey);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              scrollTo(aboutKey);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.folder_open),
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              scrollTo(projectsKey);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.file_download_rounded),
            title: const Text('Resume'),
            onTap: () {
              Navigator.pop(context);
              downloadResume();
            },
          ),
        ],
      ),
    );
  }
}
