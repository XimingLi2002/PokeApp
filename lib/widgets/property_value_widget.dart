import 'package:flutter/material.dart';

class PropertyValue extends StatelessWidget {
  final String property;
  final String value;
  const PropertyValue({super.key, required this.property, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
          text: property,
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: value, style: textTheme.bodyLarge!),
          ]),
    );
  }
}
