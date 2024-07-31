import 'package:bloc_course/bloc_api/bloc/posts_bloc.dart';
import 'package:bloc_course/bloc_api/screens/home_api.dart';
import 'package:bloc_course/counter/bloc/counter_bloc.dart';
import 'package:bloc_course/favourite_exp/bloc/favourite_bloc.dart';
import 'package:bloc_course/favourite_exp/repository/favourite_repo.dart';
import 'package:bloc_course/image_pick/bloc/image_pick_bloc.dart';
import 'package:bloc_course/slider_exp/bloc/slider_bloc.dart';
import 'package:bloc_course/to_do/bloc/todo_bloc.dart';
import 'package:bloc_course/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickBloc(Utils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (_) => PostsBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const APiHomeScreen(),
      ),
    );
  }
}
