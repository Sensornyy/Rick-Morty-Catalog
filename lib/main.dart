import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'features/presentation/bloc/search_bloc/search_bloc.dart';
import 'features/presentation/pages/characters_page.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersListCubit>(
          create: (context) => locatorService<CharactersListCubit>(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => locatorService<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black54,
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: CharactersPage(),
      ),
    );
  }
}
