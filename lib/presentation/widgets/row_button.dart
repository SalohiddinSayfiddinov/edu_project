import 'package:flutter/material.dart';

import '../../core/constants/app_consts.dart';

class RowButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final VoidCallback onPressedicon;
  final VoidCallback onPressed;
  final String title;
  const RowButton({
    super.key,
    this.color,
    this.textColor,
    required this.onPressedicon,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(50, 50)),
                backgroundColor:
                    WidgetStatePropertyAll( AppConsts.primaryColor)),
            onPressed: onPressedicon,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(220, 50),
              backgroundColor: color ?? AppConsts.primaryColor),
          onPressed: onPressed,
          child: Text(
            overflow: TextOverflow.ellipsis,
            title,
            style: TextStyle(color: textColor ?? Colors.white),
          ),
        )
      ],
    );
  }
}
