import 'package:flutter/material.dart';
import 'package:flutter_app_weather_bloc/cubits/weather/weather_cubit.dart';
import 'package:flutter_app_weather_bloc/repositories/weather_repository.dart';
import 'package:flutter_app_weather_bloc/services/weather_api_servces.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  _fetchWeather() {
    context.read<WeatherCubit>().fetchWeather('London');
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
