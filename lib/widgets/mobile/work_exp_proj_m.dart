import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/desktop/tasks_widget.dart';

class WorkExperienceMob extends StatelessWidget {
  final String? urlForApp;
  final String companyAndApp;
  final String timeSpent;
  final List<String> tasks;
  final String appImg;
  const WorkExperienceMob(
      {super.key,
      required this.urlForApp,
      required this.companyAndApp,
      required this.timeSpent,
      required this.tasks,
      required this.appImg});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // app name
        Text(companyAndApp,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        // white space
        SizedBox(
          width: deviceSize.height * 0.05,
        ),
        // time spent
        Text(timeSpent,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        // tasks
        SizedBox(
          height: deviceSize.height * 0.5,
          width: deviceSize.width * 0.7,
          child: ListView.builder(
            itemBuilder: (context, index) => TaskWidget(task: tasks[index]),
            itemCount: tasks.length,
          ),
        )
      ],
    );
  }
}
