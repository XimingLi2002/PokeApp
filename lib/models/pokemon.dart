import 'package:json_annotation/json_annotation.dart';

import 'generation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon(
      {required this.id,
      required this.pokemon,
      required this.source,
      required this.type,
      required this.description,
      required this.ability,
      required this.hiddenAbility,
      required this.generation});

  int id;
  String pokemon;
  String source;
  Set<String> type;
  String description;
  String ability;
  @JsonKey(name: "hidden_ability")
  String hiddenAbility;
  Generation generation;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
