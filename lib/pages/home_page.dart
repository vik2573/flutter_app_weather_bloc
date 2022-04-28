import 'package:flutter/material.dart';
import 'package:flutter_app_weather_bloc/repositories/weather_repository.dart';
import 'package:flutter_app_weather_bloc/services/weather_api_servces.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() {
    WeatherRepository(
      weatherApiServices: WeatherApiServices(
        httpClient: http.Client(),
      ),
    ).fetchWeather('London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
