import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translator/screens/home.dart';

import 'Application/Home/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Translator',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: const ColorScheme.dark()),
        home:  HomeScreen(),
      ),
    );
  }
}
