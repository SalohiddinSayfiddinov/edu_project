import 'dart:math';
import 'package:flutter/material.dart';

class PercentIndicator extends StatefulWidget {
  final double linesLength;
  final double radius;
  final double percent;
  final int linesAmount;
  final double linesWidth;
  final Color linesColor;
  final Color shadowColor;
  final double shadowBlur;
  final Color primaryColor;
  final Widget Function(BuildContext)? centerWidgetBuilder;
  final Duration animationDuration;
  final double fontSize;

  const PercentIndicator({
    super.key,
    this.linesLength = 50,
    this.radius = 100,
    required this.percent,
    this.linesAmount = 60,
    this.linesWidth = 2,
    this.centerWidgetBuilder,
    this.linesColor = Colors.black,
    this.shadowBlur = 50.0,
    this.shadowColor = Colors.green,
    required this.primaryColor,
    this.fontSize = 45,
    this.animationDuration = const Duration(milliseconds: 1000),
  }) : assert(percent >= 0 && percent <= 100);

  @override
  PercentIndicatorState createState() => PercentIndicatorState();
}

class PercentIndicatorState extends State<PercentIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _currentPercent = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _setupAnimation();
  }

  @override
  void didUpdateWidget(PercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.percent != oldWidget.percent) {
      _setupAnimation();
    }
  }

  void _setupAnimation() {
    _animation = Tween<double>(
      begin: _currentPercent,
      end: widget.percent,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {
          _currentPercent = _animation.value;
        });
      });
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.radius * 2 + widget.linesLength * 2,
      height: widget.radius * 2 + widget.linesLength * 2,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: _ProgressBarPainter(
                linesLength: widget.linesLength,
                radius: widget.radius,
                percent: _currentPercent,
                linesAmount: widget.linesAmount,
                linesWidth: widget.linesWidth,
                linesColor: widget.linesColor,
                shadowBlur: widget.shadowBlur,
                shadowColor: widget.primaryColor,
                primaryColor: widget.primaryColor,
              ),
              child: Center(
                child: Text(
                  "${_currentPercent.toInt()}%",
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontFamily: 'Digital',
                    color: widget.primaryColor,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 30.0,
                        color: widget.primaryColor.withValues(alpha: .9),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double linesLength;
  final double radius;
  final double percent;
  final int linesAmount;
  final double linesWidth;
  final Color linesColor;
  final double shadowBlur;
  final Color shadowColor;
  final Color primaryColor;

  late final Paint _paint;
  late final Paint _shadowPaint;

  _ProgressBarPainter({
    required this.linesLength,
    required this.radius,
    required this.percent,
    required this.linesAmount,
    required this.linesWidth,
    required this.linesColor,
    required this.shadowBlur,
    required this.shadowColor,
    required this.primaryColor,
  }) {
    _paint = Paint()
      ..color = linesColor
      ..strokeWidth = linesWidth
      ..strokeCap = StrokeCap.round;

    _shadowPaint = Paint()
      ..color = shadowColor.withValues(alpha: 0.8)
      ..strokeWidth = linesWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radiantStep = 2 * pi / linesAmount;
    final int showedLines = (percent / 100 * linesAmount).round();

    for (int i = 0; i < linesAmount; i++) {
      final double angle = i * radiantStep;

      // Calculate starting and ending points for the shadow
      final Offset startShadow = Offset(
        centerX + sin(angle) * radius,
        centerY - cos(angle) * radius,
      );
      final Offset endShadow = Offset(
        centerX + sin(angle) * (radius + linesLength),
        centerY - cos(angle) * (radius + linesLength),
      );

      // Draw shadow line
      canvas.drawLine(startShadow, endShadow, _shadowPaint);

      if (i < showedLines) {
        _paint.color = primaryColor;
      } else {
        _paint.color = primaryColor.withValues(alpha: .1);
      }

      // Calculate starting and ending points for the line
      final Offset startLine = Offset(
        centerX + sin(angle) * radius,
        centerY - cos(angle) * radius,
      );
      final Offset endLine = Offset(
        centerX + sin(angle) * (radius + linesLength),
        centerY - cos(angle) * (radius + linesLength),
      );

      // Draw the line
      canvas.drawLine(startLine, endLine, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
