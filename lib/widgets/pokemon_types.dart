import 'package:flutter/material.dart';

class PokemonTypes extends StatelessWidget {
  final Set types;
  final double width;
  const PokemonTypes({super.key, required this.types, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PokemonType(type: types.first, width: width),
        const SizedBox(width: 3),
        if (types.length > 1) PokemonType(type: types.last, width: width)
      ],
    );
  }
}

class PokemonType extends StatelessWidget {
  final String type;
  final double width;
  const PokemonType({super.key, required this.type, required this.width});

  @override
  Widget build(BuildContext context) {
    return Image(
      image:
          AssetImage("assets/images/pokemon_types/${type.toLowerCase()}.png"),
      width: width,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
    );
  }
}
