import 'package:rickmorty/features/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required id,
    required name,
    required status,
    required species,
    required type,
    required gender,
    required origin,
    required location,
    required image,
    required episode,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
        );
  factory CharacterModel.fromJson(Map<String,dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin']['name'],
      location: json['location']['name'],
      image: json['image'],
      episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList,
    );
  }
}
