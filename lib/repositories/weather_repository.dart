import 'package:flutter_app_weather_bloc/exceptions/weather_exception.dart';
import 'package:flutter_app_weather_bloc/models/castom_error.dart';
import 'package:flutter_app_weather_bloc/models/weather.dart';
import 'package:flutter_app_weather_bloc/services/weather_api_servces.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiServices.getWoeid(city);
      print('woeid: $woeid');

      final Weather weather = await weatherApiServices.getWeather(woeid);
      print('weather: $weather');

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
