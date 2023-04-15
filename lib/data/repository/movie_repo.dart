import 'package:mdb_clean_archi/data/network/client/api_client.dart';
import 'package:mdb_clean_archi/data/network/network_mapper.dart';
import 'package:mdb_clean_archi/domain/model/movie.dart';

class MovieRepository {
  final ApiClient apiClient;
  final NetowrkMapper networkMapper;

  MovieRepository({
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<Movie>> getUpComingMovies({
    required int limit,
    required int page,
  }) async {
    final upcomingMovies =
        await apiClient.getUpcomingMovies(page: page, limit: limit);
    return networkMapper.toMovies(upcomingMovies.results);
  }
}
