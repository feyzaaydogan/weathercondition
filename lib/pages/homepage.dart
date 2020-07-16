import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathercondition/pages/selectcity.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {};

  Widget build(BuildContext context) {

   
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;

   

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          
          child:PageView(
          onPageChanged:(index) async{
            dynamic result = await Navigator.pushNamed(context,'/cities');
            print(result);
            setState(() {
                    data={
                      'name':result['name'],
                      'days':result['days'],
                    
                    };
                  });
            
          } ,

            children:<Widget>[
              Container(
                child: Column(
            children: <Widget>[
                Center(
                    child: SvgPicture.network('${data['days'][0].icon}',
                        height: 60.0)),
                SizedBox(height: 20.0),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${data['name'][0].toUpperCase()}${data['name'].substring(1)}',
                        style: TextStyle(
                          fontSize: 40.0,
                          
                          fontWeight: FontWeight.bold,
                          
                          color: Colors.blue[900],
                        ),
                      ),
                      Text(
                        '${data['days'][0].description}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[900],
                        ),
                      ),
                      Text(
                        '${double.parse(data['days'][0].degree[1]).round()}°C',
                        style: TextStyle(
                          fontSize: 60.0,
                          color: Colors.blue[900],
                        ),
                      ),
                    ]),
                Divider(height: 20, thickness: 1, color: Colors.blue[100]),
                Column(
                  children: data['days'].sublist(1).map<Widget>((day) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text('${day.name}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                )),
                          ),
                          Expanded(
                            child: SvgPicture.network(
                              '${day.icon}',
                              height: 20,
                            ),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    '${double.parse(day.degree[1]).round()}°C',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ))),
                          ),
                        ],
                      ),


                    );
                  }).toList(),
                )
            ],
          ),
              ),
              Container(
               child: SelectCities(),
              ),
            ]),
        ),
      ),
      
    );
  }
}
