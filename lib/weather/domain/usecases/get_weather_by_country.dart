import 'package:clean_arch_course/weather/domain/entities/weather.dart';
import 'package:clean_arch_course/weather/domain/reposs/base_weather_repo.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepo weatherRepo;

  GetWeatherByCountryName(this.weatherRepo);

  Future<Weather>execute(String countryName) async {
    return await weatherRepo.getWeather(
      countryName,
    );
  }
}
