import 'package:flutter/material.dart';

class PokemonId extends StatelessWidget {
  final int id;
  final String pokemon;
  final double fontSize;
  const PokemonId(
      {super.key,
      required this.id,
      required this.pokemon,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: pokemon,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: fontSize, fontWeight: FontWeight.bold),
        children: [
          const WidgetSpan(child: SizedBox(width: 7)),
          TextSpan(
              text: "#${id.toString().padLeft(4, '0')}",
              style: const TextStyle(fontWeight: FontWeight.w200)),
        ],
      ),
    );
  }
}
