import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:weathercondition/services/day.dart';



class WeatherInfo {
  String city;
 List<Day> days=[];

  WeatherInfo({this.city});

  Future<List> getWeather() async {
    var response = await get(
      'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city',
      headers: {
        HttpHeaders.authorizationHeader:
            "apikey 3LDlzI3rS8sbpV4Hy4tlfg:4hwDviUJse5qoDWHk2rjMt"
      },
    );
    Map data = await jsonDecode(response.body);
    print(data['result'][0]);

        for(int i=0;i<5; i++){
        
        days.add( Day(name:data['result'][i]['day'],description: data['result'][i]['description'],degree: [data['result'][i]['min'],data['result'][i]["degree"], data['result'][i]["max"]],icon:data['result'][i]['icon']));
    }

       // days.forEach((element) {print(element.name);});


        return days;
  }
}
