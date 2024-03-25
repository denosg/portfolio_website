import 'package:url_launcher/url_launcher.dart' as url;

//TODO: add loading spinner
Future<bool> downloadResume() async {
  final resumeUrl =
      Uri.parse('https://portfolio-backend-o9hh.onrender.com/v1/downloads/pdf');

  if (await url.canLaunchUrl(resumeUrl)) {
    return await url.launchUrl(resumeUrl);
  } else {
    throw 'Could not launch $resumeUrl';
  }
}
