class AppUrl {
  static const String baseUrl = "http://localhost:8080/";
  static const String loginUrl = "${baseUrl}auth/login";
  static const String getEnfantsByIdParentUrl = "${baseUrl}children/parent/";
  static const String getEnfantsUrl = "${baseUrl}children";

  static String payment = '$baseUrl/payements/savePayement';
}
