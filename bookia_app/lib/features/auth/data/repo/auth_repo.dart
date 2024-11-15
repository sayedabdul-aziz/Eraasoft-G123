import 'dart:developer';

import 'package:bookia_app/core/services/remote/endpoints.dart';
import 'package:bookia_app/features/auth/data/model/request/user_model_params.dart';
import 'package:bookia_app/features/auth/data/model/response/user_model_response/user_model_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<UserModelResponse?> register(UserModelParams params) async {
    try {
      log(params.toJson().toString());
      var response = await Dio().post(
          AppEndpoints.baseUrl + AppEndpoints.register,
          data: params.toJson());
      log('-------1--------');
      if (response.statusCode == 201) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
  static Future<UserModelResponse?> login(UserModelParams params) async {
    try {
      var response = await Dio().post(
          AppEndpoints.baseUrl + AppEndpoints.login,
          data: params.toJson());
      log('-------1--------');
      if (response.statusCode == 200) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
