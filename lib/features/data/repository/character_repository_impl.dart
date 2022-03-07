import 'package:dartz/dartz.dart';

import 'package:rickmorty/core/error/exception.dart';
import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/core/platform/network_info.dart';
import 'package:rickmorty/features/data/data_sources/character_local_data_source.dart';
import 'package:rickmorty/features/data/data_sources/character_remote_data_source.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> loadAllCharacters(int page) async {
    return _getCharacters(() {
      return remoteDataSource.loadAllCharacters(page);
    });
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> searchCharacter(String name) {
    return _getCharacters(() {
      return remoteDataSource.searchCharacter(name);
    });
  }

  Future<Either<Failure, List<CharacterModel>>> _getCharacters(Function() getCharacters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacters = await getCharacters();
        localDataSource.charactersToCache(remoteCharacters);
        return Right(remoteCharacters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCharacters = await localDataSource.getCharacterFromCache();
        return Right(localCharacters);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
