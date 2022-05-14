import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    Key key,
    @required this.weatherIcon,
    @required this.temperature,
    @required this.desc,
    @required this.humidity,
    @required this.city,
    @required this.country,
    @required this.windSpeed,
  }) : super(key: key);

  final String weatherIcon;
  final int temperature;
  final String desc;
  final int humidity;
  final String city;
  final String country;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          color: HexColor('#F5F5F5'),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: weatherIcon == null
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(),
                      Text('Loading weather data...'),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                'https://openweathermap.org/img/wn/' +
                                    weatherIcon +
                                    '@2x.png',
                                height: 70),
                            Text(
                              '$temperature°',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.033,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#145E2E')),
                            ),
                            Text((desc != null) ? '$desc' : '',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#145E2E'))),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: HexColor('#145E2E').withOpacity(0.2),
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text('Wind: $windSpeed m/s',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.014,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#145E2E'))),
                            Text('Humidity: $humidity',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.014,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#145E2E'))),
                            Text('City: $city',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.014,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#145E2E'))),
                            Text('Country: $country',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.014,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#145E2E'))),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
