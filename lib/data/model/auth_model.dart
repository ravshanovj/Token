class AuthModel {
  String? message;
  String? accessToken;

  AuthModel({this.message, this.accessToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
  }
}
