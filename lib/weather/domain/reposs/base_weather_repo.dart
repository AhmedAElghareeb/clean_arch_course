import '../entities/weather.dart';

abstract class BaseWeatherRepo {
  Future<Weather> getWeather(String countryName);
}