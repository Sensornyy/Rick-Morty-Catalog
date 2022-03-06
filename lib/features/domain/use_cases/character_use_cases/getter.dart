import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/core/use_cases/use_case.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/domain/repositories/character_repositories/getter_repository.dart';

class Getter extends UseCase<List<CharacterEntity>, PageCharacterParams> {
  final GetterRepository getterRepository;

  Getter(this.getterRepository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(PageCharacterParams params) async {
    return await getterRepository.getAllCharacters(params.page);
  }
}

class PageCharacterParams extends Equatable {
  final int page;


  const PageCharacterParams({required this.page});

  @override
  List<Object> get props => [page];

}