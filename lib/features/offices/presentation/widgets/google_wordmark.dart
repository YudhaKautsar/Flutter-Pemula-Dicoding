import 'package:flutter/material.dart';

class GoogleWordmark extends StatelessWidget {
  const GoogleWordmark({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = <Color>[
      Color(0xFF4285F4),
      Color(0xFFEA4335),
      Color(0xFFFBBC05),
      Color(0xFF34A853),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final color in colors) ...[
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
        ],
        const SizedBox(width: 5),
        const Text(
          'Google',
          style: TextStyle(
            color: Color(0xFF5F6368),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}