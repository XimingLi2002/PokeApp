// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int,
      pokemon: json['pokemon'] as String,
      source: json['source'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toSet(),
      description: json['description'] as String,
      ability: json['ability'] as String,
      hiddenAbility: json['hidden_ability'] as String,
      generation:
          Generation.fromJson(json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'pokemon': instance.pokemon,
      'source': instance.source,
      'type': instance.type.toList(),
      'description': instance.description,
      'ability': instance.ability,
      'hidden_ability': instance.hiddenAbility,
      'generation': instance.generation,
    };
