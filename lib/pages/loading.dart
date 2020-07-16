import 'package:flutter/material.dart';
import 'package:weathercondition/services/day.dart';
import 'package:weathercondition/services/weather_info.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
    
   
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 
  List<Day> days=[];
   Map data = {};

  void initState(){

    super.initState();
    template();
 
  }

  Future<void> template() async {

    WeatherInfo a = WeatherInfo(city:'istanbul');
    var tmp=await a.getWeather();
   

   

   Navigator.pushReplacementNamed(context,'/home',arguments: 
   {
     'name':a.city,
     'days':tmp,
   });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body:Center(
      
        child: SpinKitFoldingCube(
       color:Colors.blue[500],

),
      ),
    
    );

  }
}
