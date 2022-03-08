part of 'characters_list_cubit.dart';

abstract class CharactersListState extends Equatable {
  const CharactersListState();

  @override
  List<Object> get props => [];
}

class CharactersListInitial extends CharactersListState {}

class CharactersListLoading extends CharactersListState {
  final List<CharacterEntity> oldCharacterList;
  final bool isFirstFetch;

  CharactersListLoading(this.oldCharacterList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldCharacterList];
}

class CharactersListLoaded extends CharactersListState {
  final List<CharacterEntity> characterList;

  CharactersListLoaded(this.characterList);

  @override
  List<Object> get props => [characterList];
}

class CharactersListError extends CharactersListState {
  final String errorMessage;

  CharactersListError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


