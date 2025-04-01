import 'package:flutter/material.dart';

class ExpandablePanel extends StatefulWidget {
  final Widget header;
  final Widget content;
  final EdgeInsets? padding;
  final Color? headerColor;
  final Color? arrowColor;

  const ExpandablePanel({
    super.key,
    required this.header,
    required this.content,
    this.padding,
    this.headerColor,
    this.arrowColor,
  });

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withAlpha(20)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
            color: widget.headerColor,
            padding: widget.padding ?? const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: widget.header),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(_isExpanded ? 0.5 : 0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: widget.arrowColor ?? Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          firstCurve: Curves.bounceIn,
          secondChild: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withAlpha(20)),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            padding: widget.padding ?? const EdgeInsets.all(16),
            child: widget.content,
          ),
        ),
      ],
    );
  }
}
