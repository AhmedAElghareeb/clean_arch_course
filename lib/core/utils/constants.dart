class AppConstants {
  //weather api

  static const String baseUrl = "https://api.openweathermap.org/data/2.5";
  static const String apiKey = "0cfd15ccb5d3119c73d6a8267c400d00";

//-------------------------------------------------------

  //movies api

  static const String baseUrl2 = "https://api.themoviedb.org/3";
  static const String apiKey2 = "e41d76db75c740fbe8393f9530971622";

  static const String nowPlayingPath =
      "$baseUrl2/movie/now_playing?api_key=$apiKey2";
  static const String popularPath =
      "$baseUrl2/movie/popular?api_key=$apiKey2";
  static const String topRatedPath =
      "$baseUrl2/movie/top_rated?api_key=$apiKey2";
  static String movieDetailsPath(int movieId) =>
      "$baseUrl2/movie/$movieId?api_key=$apiKey2";
  static String recommendPath(int movieId) =>
      "$baseUrl2/movie/$movieId/recommendations?api_key=$apiKey2";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
