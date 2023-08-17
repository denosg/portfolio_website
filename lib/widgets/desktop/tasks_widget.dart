import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        // white space
        SizedBox(height: deviceSize.height * 0.01),
        Row(
          children: [
            const Icon(Icons.arrow_right_rounded, color: Colors.purple),
            Expanded(child: Text(task)),
          ],
        )
      ],
    );
  }
}
