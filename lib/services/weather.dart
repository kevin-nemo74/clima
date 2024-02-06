import 'package:clima/services/location.dart';
import 'networking.dart';

const apiKey = 'd3fb918234ae237c05bfd1050cf117a0';
const openUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    NetworkHelper nHelper =
        NetworkHelper('$openUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await nHelper.getData();
    return weatherData;
  }

  Future getLocationData() async {
    Location loc1 = Location();
    await loc1.getCurrentLocation();
    NetworkHelper nHelper = NetworkHelper(
        '$openUrl?lat=${loc1.latitude}&lon=${loc1.longtitude}&appid=$apiKey&units=metric');

    var weatherData = await nHelper.getData();
    return weatherData;
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
