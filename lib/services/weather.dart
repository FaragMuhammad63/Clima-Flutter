import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const api_url = 'http://api.openweathermap.org/data/2.5/weather';
const apiKey = 'b03e555fb682110ee9e8772219b0f2b7';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();

    String url = '$api_url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getCityWeather(String cityName) async {

    String url = '$api_url?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
