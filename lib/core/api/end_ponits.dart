class EndPoint {
  static String baseUrl = "https://food-api-omega.vercel.app/api/v1/";
  static String signIn = "user/signin";
  static String signUp = "user/signUp";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String name = "name";
  static String email = "email";
  static String phone = "phone";
  static String password = "password";
  static String confirmPassword = "confirmPassword";
  static String profilePic = "profilePic";
  static String location = "location";
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String token = "token";
  static String id = "id";
  static String message = "message";
}
