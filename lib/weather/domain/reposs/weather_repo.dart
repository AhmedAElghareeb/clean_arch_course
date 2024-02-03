import '../entities/weather.dart';

abstract class WeatherRepo {
  Future<Weather> getWeather(String cityName);
}