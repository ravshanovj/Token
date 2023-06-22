import 'package:access_token_practice/core/config/dio_catch_config.dart';
import 'package:access_token_practice/core/config/dio_config.dart';
import 'package:access_token_practice/core/constants/end_points.dart';
import 'package:dio/dio.dart';

import '../model/auth_model.dart';

class AuthService {
  Future<dynamic> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      Response response =
          await DioConfig.createRequest().post(EndPoints.register, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      });
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      Response response =
          await DioConfig.createRequest().post(EndPoints.login, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
