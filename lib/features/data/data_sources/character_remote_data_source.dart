import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickmorty/core/error/exception.dart';

import 'package:rickmorty/features/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> searchCharacter(String name);

  Future<List<CharacterModel>> loadAllCharacters(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> searchCharacter(String name) async {
    return _getCharacterFromUrl('https://rickandmortyapi.com/api/character/?name=$name');
  }

  @override
  Future<List<CharacterModel>> loadAllCharacters(int page) {
    return _getCharacterFromUrl('https://rickandmortyapi.com/api/character/?page=$page');
  }

  Future<List<CharacterModel>> _getCharacterFromUrl(String url) async {
    final response =
        await client.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final characters = json.decode(response.body);
      return (characters['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
