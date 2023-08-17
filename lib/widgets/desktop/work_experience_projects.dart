import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/desktop/tasks_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class WorkExperience extends StatelessWidget {
  final String urlForApp;
  final String companyAndApp;
  final String timeSpent;
  final List<String> tasks;
  final String appImg;
  const WorkExperience(
      {super.key,
      required this.urlForApp,
      required this.companyAndApp,
      required this.timeSpent,
      required this.tasks,
      required this.appImg});

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
    final deviceSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // info related work // TODO: Add link to app page in Google Play Store / iOS play store when user clicks on app
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text about hupu app -> + tasks I've made
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // app name
                  Text(companyAndApp,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  // white space
                  SizedBox(
                    width: deviceSize.height * 0.05,
                  ),
                  // time spent
                  Text(timeSpent,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                  // tasks
                  SizedBox(
                    height: deviceSize.height * 0.5,
                    width: deviceSize.width * 0.5,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          TaskWidget(task: tasks[index]),
                      itemCount: tasks.length,
                    ),
                  )
                ],
              ),
              // image of hupu app
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => openLink(urlForApp),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(appImg,
                          fit: BoxFit.cover, height: deviceSize.height * 0.5),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
