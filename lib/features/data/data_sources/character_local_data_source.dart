import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:rickmorty/core/error/exception.dart';
import 'package:rickmorty/features/data/models/character_model.dart';

abstract class CharacterLocalDataSource {
  /// Gets the cached [List<CharacterModel>] which was gotten the last time
  /// the user had an Internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<List<CharacterModel>> getCharacterFromCache();

  Future<void> charactersToCache(List<CharacterModel> characters);
}

const cachedList = 'cachedCharacterList';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final SharedPreferences sharedPreferences;

  CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CharacterModel>> getCharacterFromCache() {
    final characterListJson = sharedPreferences.getStringList(cachedList);
    if (characterListJson!.isNotEmpty) {
      return Future.value(characterListJson
          .map((character) => CharacterModel.fromJson(json.decode(character)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> charactersToCache(List<CharacterModel> characters) {
    final List<String> charactersListJson =
        characters.map((character) => json.encode(character.toJson())).toList();

    sharedPreferences.setStringList(cachedList, charactersListJson);
    return Future.value(charactersListJson);
  }
}
