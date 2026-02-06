import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? background;
  final double maxWidth;

  const SectionContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    this.background,
    this.maxWidth = 1200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
