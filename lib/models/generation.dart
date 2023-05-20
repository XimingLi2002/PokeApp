import 'package:json_annotation/json_annotation.dart';

import 'pokemon.dart';

part 'generation.g.dart';

@JsonSerializable()
class Generation {
  Generation({
    required this.id,
    required this.name,
    this.pokemons,
  });

  int id;
  String name;
  Set<Pokemon?>? pokemons;

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);
  Map<String, dynamic> toJson() => _$GenerationToJson(this);
}
