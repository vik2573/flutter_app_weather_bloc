import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_weather_bloc/cubits/weather/weather_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_weather_bloc/pages/home_page.dart';
import 'package:flutter_app_weather_bloc/repositories/weather_repository.dart';
import 'package:flutter_app_weather_bloc/services/weather_api_servces.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          httpClient: http.Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
