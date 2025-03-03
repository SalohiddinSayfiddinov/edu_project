import 'package:flutter/material.dart';

class ToggleText extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color1;
  final Color color2;
  const ToggleText({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color1,
    required this.color2,
  });
  @override
  State<ToggleText> createState() => _ToggleTextState();
}

class _ToggleTextState extends State<ToggleText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 150,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: widget.color1, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(color: widget.color2, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
