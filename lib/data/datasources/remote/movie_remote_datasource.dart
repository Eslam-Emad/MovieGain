import 'package:dio/dio.dart';
import 'package:movie_gain/core/constants/api_path.dart';
import 'package:movie_gain/core/networking/dio_client.dart';
import 'package:movie_gain/data/models/movie_model.dart';
import '../../../core/exception/exception.dart';
import '../../models/movies_list_model.dart';

class MovieRemoteDatasource {
  final DioClient _dioClient;

  MovieRemoteDatasource(this._dioClient);

  Future<MovieModel> getMovieById(String movieId) async {
    try {
      final response =
          await _dioClient.get(baseEndpoint + movieId + whereApiKeyQuery);
      final movie = MovieModel.fromMap(response.data);
      print("movie : ${movie.title}");
      return movie;
    } on DioError catch (dioError) {
      throw Failure.fromDioError(dioError);
    } catch (error) {
      print("error : $error");
      throw '..Oops $error';
    }
  }
}
