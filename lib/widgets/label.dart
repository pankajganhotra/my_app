import 'package:flutter/cupertino.dart';

class Label extends StatelessWidget {
  final Color? color;
  final Widget child;
  const Label({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
