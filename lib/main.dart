import 'package:bloc_course/counter/bloc/counter_bloc.dart';
import 'package:bloc_course/image_pick/bloc/image_pick_bloc.dart';
import 'package:bloc_course/slider_exp/bloc/slider_bloc.dart';
import 'package:bloc_course/to_do/screens/todo_home.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const TodoHomeScreen(),
      ),
    );
  }
}
