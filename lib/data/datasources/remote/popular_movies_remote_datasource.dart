import 'package:dio/dio.dart';
import 'package:movie_gain/core/constants/api_path.dart';
import 'package:movie_gain/core/networking/dio_client.dart';
import '../../../core/exception/exception.dart';
import '../../models/movies_list_model.dart';

class PopularMoviesRemoteDatasource {
  final DioClient _dioClient;

  PopularMoviesRemoteDatasource(this._dioClient);

  Future<MovieListModel> getPopularMovies() async {
    try {
      final response = await _dioClient.get(popularMovies + whereApiKeyQuery);
      final popularMovie = MovieListModel.fromMap(response.data);
      print("popularMovie : ${popularMovie.movies?.first.id}");
      return popularMovie;
    } on DioError catch (dioError) {
      throw Failure.fromDioError(dioError);
    } catch (error) {
      print("error : $error");
      throw '..Oops $error';
    }
  }
}
