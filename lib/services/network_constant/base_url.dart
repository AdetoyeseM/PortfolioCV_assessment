class API {
  static String clientID = "694ce0aafdfbc47ad583";
  static String clientSecret = "58709f1741ce72e8102a05b41412b38750bf1cd0";
  static const String baseURL = "https://api.github.com/search/users";
  static const users = "$baseURL?q=location:nigeria&per_page=50";
  static userProfile(String? username) =>
      "/$username?client_id=$clientID&client_secret=$clientSecret";
}
