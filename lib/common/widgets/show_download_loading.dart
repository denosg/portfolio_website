import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website/common/widgets/animated_text.dart';

Future<void> showLoading(BuildContext context, {required String text}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.transparent),
          ),
          const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    )),
                SizedBox(height: 16),
                AnimatedTextWidget(),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ],
      );
    },
  );
}
