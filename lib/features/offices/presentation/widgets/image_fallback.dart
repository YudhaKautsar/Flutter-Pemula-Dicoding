import 'package:flutter/material.dart';

class ImageFallback extends StatelessWidget {
  const ImageFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFE3ECE8),
      child: Center(
        child: Icon(Icons.apartment, size: 34, color: Color(0xFF287A65)),
      ),
    );
  }
}