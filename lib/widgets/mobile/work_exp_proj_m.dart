import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/providers/link_prov.dart';
import 'package:portfolio_website/providers/tasks_dim_prov.dart';
import 'package:portfolio_website/widgets/desktop/tasks_widget.dart';

class WorkExperienceMob extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = useState(false);
    final deviceSize = MediaQuery.of(context).size;
    final taskDimProv = ref.read(tasksDimProv.notifier);
    bool hasUrl = urlForApp != null;

    final link = Link();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(companyAndApp,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(
                  width: deviceSize.height * 0.05,
                ),
                Text(timeSpent,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
            if (hasUrl)
              IconButton(
                icon: const Icon(Icons.link),
                color: Colors.purple,
                onPressed: () => link.openLink(urlForApp!),
              ),
          ],
        ),
        Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: expanded.value ? tasks.length * 65.0 + 27 : 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "Show more details:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          expanded.value = !expanded.value;
                          if (expanded.value) {
                            taskDimProv.setDim(tasks.length * 65.0 + 70);
                          } else {
                            taskDimProv.reset();
                          }
                        },
                        iconSize: 20,
                        icon: Icon(expanded.value
                            ? Icons.expand_less
                            : Icons.expand_more),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: expanded.value ? tasks.length * 65.0 - 29 : 0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: tasks
                              .map((task) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 5),
                                    child: TaskWidget(
                                      task: task,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
