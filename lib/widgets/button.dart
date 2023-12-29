import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    this.title,
    this.onPressed,
    Color? color,
    this.isOperator = false,
    this.icon,
  }) : color = color ?? const Color(0xFF2D2F38);

  final String? title;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isOperator;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) => color),
        shape: MaterialStateProperty.resolveWith(
          (states) => const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(71, 71),
        ),
      ),
      child: Center(
        child: icon ??
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: isOperator ? FontWeight.bold : FontWeight.normal,
              ),
            ),
      ),
    );
  }
}
