import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rickmorty/features/presentation/bloc/characters_list/characters_list_cubit.dart';
import 'common/app_colors.dart';
import 'features/presentation/bloc/search_bloc/search_bloc.dart';
import 'features/presentation/pages/home_page.dart';
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
          create: (context) => locatorService<CharactersListCubit>()..loadCharacters(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => locatorService<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(caption: TextStyle(fontFamily: 'Roboto Slab', fontSize:  22, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontFamily: 'Roboto Slab', fontSize: 19, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontFamily: 'Roboto Slab', fontSize: 12, fontWeight: FontWeight.normal),
          subtitle1: TextStyle(fontFamily: 'Roboto Slab', fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey)
          ),
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.mainBackground,
        ),
        home: HomePage(),
      ),
    );
  }
}
