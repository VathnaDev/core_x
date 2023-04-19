import 'package:core_x/extensions/number.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/material_colors_utils.dart';

class DevTabs extends StatelessWidget {
  const DevTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: 3.paddingAllEdge,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: Colors.white, width: 3)),
        child: TabBar(
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: MaterailColorUtils.random,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          splashBorderRadius: BorderRadius.circular(99),
          tabs: [
            Tab(
              child: Text(
                "ONE",
                style: TextStyle(fontFamily: GoogleFonts.newRocker().fontFamily),
              ),
            ),
            Tab(
              child: Text(
                "TWO",
                style: TextStyle(fontFamily: GoogleFonts.newRocker().fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
