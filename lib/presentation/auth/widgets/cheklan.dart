import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

import 'my_container.dart';

class ChekLan extends StatefulWidget {
  final VoidCallback onpressed;
  final Color color;
  final FlagsCode code;
  final String text2;
  const ChekLan({
    super.key,
    required this.text2,
    required this.code,
    required this.onpressed,
    required this.color,
  });

  @override
  State<ChekLan> createState() => _ChekLanState();
}

class _ChekLanState extends State<ChekLan> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: widget.color,
      onpressed: widget.onpressed,
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flag.fromCode(
            borderRadius: 14,
            widget.code,
            height: 40,
            width: 40,
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Language",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                widget.text2,
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
