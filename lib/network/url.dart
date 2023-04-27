class Url {
  //API key
  static const String apiKey = "9c9576f8c2e86949a3220fcc32ae2fb6";

  //Base URLs
  static const String movieDbBaseUrl = 'https://api.themoviedb.org/3';

  //Authentication URLs
  static String? guestSessionId;

  //Logo & Background Images Path&Urls
  static const String appLogoUrl =
      "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png";
  static const String appLogoPath = "assets/icons/app_logo.png";

  //Movies URLs
  static const String nowPlayingMovies = '/movie/now_playing';
  static String rateMovie(int movieId) => '/movie/$movieId/rating';
}
