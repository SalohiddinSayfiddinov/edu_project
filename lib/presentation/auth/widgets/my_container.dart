import 'package:flutter/material.dart';

import '../../../core/constants/app_consts.dart';

class MyContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback onpressed;
  final Color? color;
  const MyContainer({
    super.key,
    required this.child,
    required this.onpressed,
    this.color,
  });

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(color: widget.color ?? Colors.transparent),
            boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  offset: Offset(0, 15),
                  spreadRadius: 0,
                  color: AppConsts.shadow.withValues(alpha: 0.3))
            ],
            color: AppConsts.grey,
            borderRadius: BorderRadius.circular(25)),
        child: widget.child,
      ),
    );
  }
}
