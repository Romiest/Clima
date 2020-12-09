import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const urlConst='';
const kAPIkey = '2100d7288e6491d17a66b661421814cc';

class WeatherModel  {


  Future<dynamic> getCityWeather(String name) async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$kAPIkey&units=metric';
   Network api=Network(url);
   var weatherData= await api.getData();
    return weatherData;
  }




Future <dynamic> getLocationWeather() async{
  Location l1 = Location();
  await l1.GetCurrentLocation();

  Network api = Network(
      'https://api.openweathermap.org/data/2.5/weather?lat=${l1.latitude}&lon=${l1.longitude}&appid=$kAPIkey&units=metric');
  var weatherData = await api.getData();
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
