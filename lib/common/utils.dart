//TODO: add loading spinner
import 'package:url_launcher/url_launcher.dart';

Future<bool> downloadResume() async {
  final resumeUrl =
      Uri.parse('https://portfolio-backend-o9hh.onrender.com/v1/downloads/pdf');

  if (await canLaunchUrl(resumeUrl)) {
    return await launchUrl(resumeUrl);
  } else {
    throw 'Could not launch $resumeUrl';
  }
}
