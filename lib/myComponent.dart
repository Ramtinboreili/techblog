import 'package:flutter/material.dart';

class techDivider extends StatelessWidget {
  const techDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: Color.fromARGB(193, 112, 112, 112),
      indent: size.width/5,
      endIndent: size.width/5,
      );
  }
}

