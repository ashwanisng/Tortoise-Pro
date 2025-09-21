import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double width;
  final double height;
  final double dotSize;
  final double dotSpacing;
  final Color backgroundColor;
  final Color inactiveDotColor;
  final Color activeDotColor;
  final Duration animationDuration;

  const SliderWidget({
    super.key,
    this.count = 3,
    required this.currentIndex,
    this.width = 74,
    this.height = 20,
    this.dotSize = 8,
    this.dotSpacing = 10,
    this.backgroundColor = const Color(0xFFDDDDDD),
    this.inactiveDotColor = const Color(0xFFF1F1F1),
    this.activeDotColor = const Color(0xFFE6E6E6),
    this.animationDuration = const Duration(milliseconds: 220),
  }) : assert(count > 0),
       assert(currentIndex >= 0 && currentIndex < count);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (i) {
            final bool isActive = i == currentIndex;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
              child: AnimatedContainer(
                duration: animationDuration,
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: isActive ? activeDotColor : inactiveDotColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
