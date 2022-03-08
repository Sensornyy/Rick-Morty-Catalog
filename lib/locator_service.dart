import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:rickmorty/core/platform/network_info.dart';
import 'package:rickmorty/features/data/data_sources/character_local_data_source.dart';
import 'package:rickmorty/features/data/data_sources/character_remote_data_source.dart';
import 'package:rickmorty/features/domain/repository/character_repository.dart';
import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'package:rickmorty/features/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/repository/character_repository_impl.dart';
import 'features/domain/use_cases/character_use_cases/loader.dart';
import 'features/domain/use_cases/character_use_cases/searcher.dart';

final locatorService = GetIt.instance;

Future<void> init() async {
  /// BLoC / Cubit
  locatorService.registerFactory(
    () => CharactersListCubit(
      loader: locatorService(),
    ),
  );
  locatorService.registerFactory(
    () => SearchBloc(
      searcher: locatorService(),
    ),
  );

  /// UseCases
  locatorService.registerLazySingleton(
    () => Loader(
      locatorService(),
    ),
  );
  locatorService.registerLazySingleton(
    () => Searcher(
      locatorService(),
    ),
  );

  /// Repository
  locatorService.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: locatorService(),
      localDataSource: locatorService(),
      networkInfo: locatorService(),
    ),
  );

  locatorService.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(
      client: locatorService(),
    ),
  );

  locatorService.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(
      sharedPreferences: locatorService()),
  );

  /// Core
  locatorService.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(locatorService()),
  );

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  locatorService.registerLazySingleton(() => sharedPreferences);

  locatorService.registerLazySingleton(
    () => http.Client(),
  );

  locatorService.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
