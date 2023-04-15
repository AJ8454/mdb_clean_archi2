import 'package:mdb_clean_archi/data/network/entity/movie_entity.dart';
import 'package:mdb_clean_archi/domain/exceptions/mapper_exception.dart';
import 'package:mdb_clean_archi/domain/model/movie.dart';

class NetowrkMapper {
  Movie toMovie(MovieEntity entity) {
    try {
      return Movie(
        id: entity.id,
        title: entity.titleText.text,
        imageUrl: entity.primaryImage?.url,
        releaseDate: DateTime(
          entity.releaseDate.year,
          entity.releaseDate.month,
          entity.releaseDate.day,
        ),
      );
    } catch (e) {
      throw MapperException<MovieEntity, Movie>(e.toString());
    }
  }

  List<Movie> toMovies(List<MovieEntity> entities) {
    final List<Movie> movies = [];

    for (var entity in entities) {
      try {
        movies.add(toMovie(entity));
      } catch (e) {
        print("could not map entity $e");
      }
    }
    return movies;
  }
}
