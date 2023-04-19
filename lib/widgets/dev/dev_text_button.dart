import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base_dev_button.dart';

class DevTextButton extends StatelessWidget {
  DevTextButton({
    super.key,
    this.spacer = 8.0,
    this.title = "",
    this.shadowColor,
    this.onTap,
  });

  String title;
  double spacer;
  Color? shadowColor;
  GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseDevButton(
      spacer: spacer,
      shadowColor: shadowColor,
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.newRocker().fontFamily,
        ),
      ),
    );
  }
}
