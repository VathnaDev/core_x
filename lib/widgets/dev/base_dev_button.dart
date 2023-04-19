import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../utils/material_colors_utils.dart';

class BaseDevButton extends StatelessWidget {
  BaseDevButton({
    super.key,
    this.spacer = 8.0,
    this.shadowColor,
    this.onTap,
    this.child,
  });

  double spacer;
  Color? shadowColor;
  GestureTapCallback? onTap;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(
          right: 16,
          top: 4,
          bottom: 4,
          left: 16,
        ),
        height: 60,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              top: spacer,
              left: spacer,
              child: Container(
                margin: EdgeInsets.only(left: spacer, top: spacer),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(6),
                  color: shadowColor ?? MaterailColorUtils.random,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: spacer,
              right: spacer,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Material(
                  color: Colors.black,
                  child: InkWell(
                    onTap: onTap,
                    child: Ink(
                      child: Center(
                        child: FadeIn(
                          delay: const Duration(milliseconds: 150),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
