import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async { //future is equivalent to promises in JavaScript
    const String apiKey = '630dcfa0ed1002b7bf8c20fa86d744e4';
    // cityName.replaceAll(" ", '%20');

    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path:'data/2.5/weather',
      queryParameters: { 'q': cityName, 'appid':apiKey, 'units':'metric'},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200 /*ok*/) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception("failed to load weather information");
    }

  }
}