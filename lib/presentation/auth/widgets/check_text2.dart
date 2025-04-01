import 'package:flutter/material.dart';

class ToggleText1 extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color1;
  final Color color2;
  const ToggleText1({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color1,
    required this.color2,
  });
  @override
  State<ToggleText1> createState() => _ToggleText1State();
}

class _ToggleText1State extends State<ToggleText1> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: widget.color1, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: widget.color2, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
