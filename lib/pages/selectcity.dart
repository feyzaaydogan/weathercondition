import 'package:flutter/material.dart';
import 'package:weathercondition/services/weather_info.dart';

class SelectCities extends StatefulWidget {
  @override
  _SelectCitiesState createState() => _SelectCitiesState();
}



class _SelectCitiesState extends State<SelectCities> {

  List<String> cities = [
    "adana","adıyaman","afyon","ağrı","amasya","ankara","antalya","artvin","aydın","balıkesir","bilecik","bingöl","bitlis","bolu",
    "burdur","bursa","çanakkale","çankırı","çorum","denizli","diyarbakır","edirne","elazığ","erzincan","erzurum","eskişehir","gaziantep",
    "giresun","gümüşhane","hakkari","hatay","ısparta","mersin","istanbul","izmir","kars","kastamonu","kayseri","kırklareli","kırşehir",
    "kocaeli","konya","kütahya","malatya","manisa","kahramanmaraş","mardin","muğla","muş","nevşehir","niğde","ordu","rize","sakarya",
    "samsun","siirt","sivas","tekirdağ","tokat","trabzon","tunceli","şanlıurfa","uşak","van","yozgat","zonguldak","aksaray",
    "bayburt","karaman","kırıkkale","batman","şırnak","bartın","ardahan","ığdır","yalova","karabük","kilis","osmaniye","düzge"
  ];

void updateTime(index) async{

 WeatherInfo instance=WeatherInfo(city:'${cities[index]}');;
   var tmp=await instance.getWeather();

Navigator.pushReplacementNamed(context,'/home',arguments:{
    'name':cities[index],
    'days':tmp,

});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue[50],
                
                
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          updateTime(index);
                          
                        },
                        leading: Icon(Icons.location_on),
                        title: Text(
                          '${cities[index][0].toUpperCase()}${cities[index].substring(1)}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
