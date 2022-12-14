import 'package:dio/dio.dart';
import 'movie_model.dart';

class MovieRepository {
  const MovieRepository(this.client);

  final Dio client;

  Future<List<MovieModel>> getMovies() async {
    try {
      const url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      final response = await client.get(url);

      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
          (json) => MovieModel.from(
            json['id'].toString(),
            json['title'],
            'https://image.tmdb.org/t/p/w185${json['poster_path']}',
            json['vote_count'].toString(),
            json['vote_average'].toString(),
            json['overview'],
          ),
        ),
      );

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
