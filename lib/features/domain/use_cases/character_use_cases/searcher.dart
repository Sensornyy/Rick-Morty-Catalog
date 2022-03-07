import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/core/use_cases/use_case.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/domain/repository/character_repository.dart';

class Searcher extends UseCase<List<CharacterEntity>, SearchCharacterParams> {
  final CharacterRepository searcherRepository;

  Searcher(this.searcherRepository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(SearchCharacterParams params) async {
    return await searcherRepository.searchCharacter(params.name);
  }
}

class SearchCharacterParams extends Equatable {
  final String name;

  const SearchCharacterParams({required this.name});

  @override
  List<Object> get props => [name];
}