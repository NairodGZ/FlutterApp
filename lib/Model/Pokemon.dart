
import 'package:json_annotation/json_annotation.dart';

part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
   int id;
   String name;
   String image;


  Pokemon({
     required this.id,
     required this.name,
     required this.image,

  });

  // factory Pokemon.fromJson(Map<String, dynamic> json) {
  //   return Pokemon(
  //     id: json['id'] ?? 0,
  //     name: json['name'] ?? '',
  //     image: json['image'] ?? '',
  //
  //   );
  // }

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  /// Connect the generated [_$PokemonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PokemonToJson(this);


}
