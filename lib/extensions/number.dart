import 'package:flutter/widgets.dart';

extension IntExt on int {
  Duration get minute => Duration(minutes: this);
  Duration get second => Duration(seconds: this);
  Duration get milliSecond => Duration(milliseconds: this);

  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());

  BorderRadius get radius => BorderRadius.circular(toDouble());

  EdgeInsets get paddingAllEdge => EdgeInsets.all(toDouble());
  EdgeInsets get paddingHorizontalSide => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingVerticalSide => EdgeInsets.symmetric(vertical: toDouble());

  Widget get widthSliver => SliverToBoxAdapter(child: width);
  Widget get heightSliver => SliverToBoxAdapter(child: height);
}
