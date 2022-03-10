import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/app_colors.dart';
import 'locator_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'features/presentation/bloc/search_bloc/search_bloc.dart';
import 'features/presentation/pages/home_page.dart';


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
          create: (context) => locatorService<CharactersListCubit>()..loadCharacters(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => locatorService<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.mainBackground,
        ),
        home: HomePage(),
      ),
    );
  }
}
