import 'package:url_launcher/url_launcher.dart';

class Link {
  void openLink(String stringUrl) async {
    final openUrl = Uri.parse(stringUrl);

    if (await canLaunchUrl(openUrl)) {
      await launchUrl(openUrl);
    } else {
      throw 'Could not launch $openUrl';
    }
  }
}
