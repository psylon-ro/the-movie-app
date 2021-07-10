import 'networking.dart';

const apikey = 'cec0dcfae00f697dd910b56740f57141';

class GetMovies {
  Future<dynamic> gettingMovies(String year) async {
    Networking data = Networking(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=$year&with_watch_monetization_types=flatrate');
    Map moviesdata = await data.getData();
    List datamovies = moviesdata['results'];
    return datamovies;
  }

  Future<dynamic> gettingGenre() async {
    Networking data = Networking(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$apikey&language=en-US');
    Map genredata = await data.getData();
    List trendingmovies = genredata['genres'];
    return trendingmovies;
  }
}
