import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_switch.dart';
import 'base_dev_button.dart';

class DevSwitch extends StatefulWidget {
  DevSwitch({
    super.key,
    this.spacer = 8.0,
    this.label = "",
    this.shadowColor,
    this.onChange,
    this.isEnabled = false,
    this.onTap,
  });

  final bool isEnabled;
  final String label;
  final double spacer;
  final Color? shadowColor;
  final Function(bool)? onChange;
  final GestureTapCallback? onTap;

  @override
  State<DevSwitch> createState() => DevSwitchState();
}

class DevSwitchState extends State<DevSwitch> {
  @override
  Widget build(BuildContext context) {
    return BaseDevButton(
      spacer: widget.spacer,
      shadowColor: widget.shadowColor,
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: widget.label.isEmpty
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (widget.label.isNotEmpty)
            Expanded(
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.newRocker().fontFamily,
                ),
              ),
            ),
          if (widget.label.isNotEmpty) SizedBox(width: 8),
          AnimatedSwitch(
            initialValue: widget.isEnabled,
            onChange: widget.onChange,
          ),
        ],
      ),
    );
  }
}
