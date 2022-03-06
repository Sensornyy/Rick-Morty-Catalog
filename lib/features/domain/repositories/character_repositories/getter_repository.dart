import 'package:dartz/dartz.dart';

import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';

abstract class GetterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters(int page);
}