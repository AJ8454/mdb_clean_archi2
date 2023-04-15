import 'package:flutter/material.dart';
import 'package:mdb_clean_archi/main.dart';
import 'package:mdb_clean_archi/presentation/movie_list_screen.dart';
import 'package:provider/provider.dart';

class MdbApp extends StatelessWidget {
  final InitialData data;
  const MdbApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: const MaterialApp(
        title: 'Movie App',
        home: MovieListScreen(),
      ),
    );
  }
}
