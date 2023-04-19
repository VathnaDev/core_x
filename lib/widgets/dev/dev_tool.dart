import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dev_text_button.dart';
import 'model/dev_tool_item.dart';

class DevTool extends StatelessWidget {
  DevTool({
    super.key,
    required this.items,
    this.onClose,
    this.onItemTap,
  });

  List<DevToolItem> items;
  GestureTapCallback? onClose;
  Function(DevToolItem)? onItemTap;

  final animationDuration = const Duration(milliseconds: 150);

  late AnimationController closeAnimationController;

  late List<AnimationController> listItemAnimationController = [];

  void reverseCloseAnimation() {
    closeAnimationController.reverse();
    for (var element in listItemAnimationController) {
      element.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                'DevTools',
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue,
                  fontFamily: GoogleFonts.pressStart2p().fontFamily,
                ),
              ),
              // Solid text as fill.
              Text(
                'DevTools',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey[300],
                  fontFamily: GoogleFonts.pressStart2p().fontFamily,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FadeInLeft(
                    controller: (controller) =>
                        closeAnimationController = controller,
                    duration: animationDuration,
                    child: DevTextButton(
                      title: "X",
                      shadowColor: Colors.red,
                      onTap: () {
                        reverseCloseAnimation();
                        onClose?.call();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: items
                          .asMap()
                          .entries
                          .map(
                            (e) => FadeInRight(
                              controller: (controller) =>
                                  listItemAnimationController.add(controller),
                              delay: Duration(milliseconds: (e.key * 100)),
                              duration: animationDuration,
                              child: DevTextButton(
                                title: e.value.title,
                                onTap: () {
                                  onItemTap?.call(e.value);
                                  reverseCloseAnimation();
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
