import 'package:edu_project/widgets/my_text.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class ReportBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          Gap(37),  MyText(title: "Report"),Gap(14),Container(color: Color(0xffA0A9B4), child: Column(children: [Row()],),)
          ],
        ),
      ),
    );
  }
}
