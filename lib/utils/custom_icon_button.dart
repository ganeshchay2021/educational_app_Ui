// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;
  const CustomIconButton({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 0.5,
            )
          ]),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        splashColor: kPrimaryLight,
        child: child,
      ),
    );
  }
}
