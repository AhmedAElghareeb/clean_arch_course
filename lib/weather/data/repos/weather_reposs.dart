import 'package:clean_arch_course/weather/data/data_source/remote_datasource.dart';
import 'package:clean_arch_course/weather/domain/entities/weather.dart';
import 'package:clean_arch_course/weather/domain/reposs/base_weather_repo.dart';

class WeatherRepository implements BaseWeatherRepo{

  final BaseRemoteDataSource baseRemoteDataSource;
  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeather(String countryName) async {
    return (await baseRemoteDataSource.getWeatherByCountryName(countryName,))!;
  }

}