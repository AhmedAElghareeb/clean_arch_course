import 'dart:convert';

import 'package:clean_arch_course/core/utils/constants.dart';
import 'package:clean_arch_course/weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    try {
      var response = await Dio().get(
        "${AppConstants.baseUrl}/weather?q=$countryName&appid=${AppConstants.apiKey}",
      );
      print(response,);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print(e,);
      return null;
    }
  }

}