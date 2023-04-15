import 'package:flutter/material.dart';
import 'package:mdb_clean_archi/data/repository/movie_repo.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    final movieRepo = Provider.of<MovieRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Upcoming Movies")),
      body: FutureBuilder(
        future: movieRepo.getUpComingMovies(limit: 10, page: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: List.generate(
              snapshot.data!.length,
              (index) => ListTile(
                title: Text(snapshot.data![index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
