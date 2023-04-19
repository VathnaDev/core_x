import 'package:flutter/material.dart';

class AnimatedSwitch extends StatefulWidget {
  final bool initialValue;
  final Color selectedColor;
  final Function(bool)? onChange;

  const AnimatedSwitch({
    super.key,
    this.onChange,
    required this.initialValue,
    this.selectedColor = Colors.cyan,
  });
  @override
  _AnimatedSwitchState createState() => _AnimatedSwitchState();

  static _AnimatedSwitchState of(BuildContext context) =>
      context.findAncestorStateOfType<_AnimatedSwitchState>()!;
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  late bool isEnabled = widget.initialValue;
  final animationDuration = const Duration(milliseconds: 200);

  void setEnabled(bool x) {
    setState(() {
      isEnabled = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange?.call(!isEnabled);
        setState(() {
          isEnabled = !isEnabled;
        });
      },
      child: AnimatedContainer(
        height: 30,
        width: 60,
        duration: animationDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isEnabled
              ? widget.selectedColor
              : widget.selectedColor.withOpacity(0.1),
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 3,
              blurRadius: 2,
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: animationDuration,
          alignment: isEnabled ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
