import 'package:dartz/dartz.dart';

import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> loadAllCharacters(int page);
  Future<Either<Failure, List<CharacterEntity>>> searchCharacter(String name);
}