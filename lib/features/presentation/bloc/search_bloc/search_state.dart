part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<CharacterEntity> characters;

  const SearchLoaded({required this.characters});

  @override
  List<Object> get props => [characters];
}

class SearchError extends SearchState {
  final String errorMessage;

  const SearchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}