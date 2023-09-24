import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  const Button({
    Key? key,
    required this.widget,
    required this.onPressed,
    this.width = 200.0,
    this.height = 50.0,
    this.borderRadius = 8.0,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            alignment: Alignment.center,
            child: widget,
          ),
        ),
      ),
    );
  }
}
