import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import 'package:rickmorty/core/error/report_failure.dart';
import 'package:rickmorty/core/error/failure.dart';
import 'package:rickmorty/features/domain/entities/character_entity.dart';
import 'package:rickmorty/features/domain/use_cases/character_use_cases/searcher.dart';

part 'search_event.dart';

part 'search_state.dart';



class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Searcher searcher;

  SearchBloc({required this.searcher}) : super(SearchInitial()) {
    on<Search>(_onSearch);
  }

  _onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final responseFromRepository = await searcher(SearchCharacterParams(name: event.name));
    emit(
      responseFromRepository.fold(
        (failure) => SearchError(errorMessage: reportFailure(failure)),
        (character) => SearchLoaded(characters: character),
      ),
    );
  }
}

