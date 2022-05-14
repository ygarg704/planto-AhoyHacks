// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planto/Model/add_location._weather.dart';
import 'package:planto/Model/diseaseProvider.dart';
import 'package:planto/Model/product_provider.dart';
import 'package:planto/screens/diseaseData.dart';
import 'package:planto/widgets/planto_bar.dart';
import 'package:planto/widgets/recent_Carousel.dart';
import 'package:planto/widgets/TestScreen_Image.dart';
import 'package:planto/widgets/testScreen_MarketGrid.dart';
import 'package:planto/widgets/weather_tile.dart';
import 'package:tflite/tflite.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var _isLoading = false;
  var _isRecentLoad = false;
  var _isAdding = false;
  var _isInit = true;

  PickedFile _image;
  List _output;
  final _picker = ImagePicker();

  int temperature;
  String condition;
  int humidity;
  double wind_speed;
  String country;
  String city;
  String weatherIcon;
  String desc;
  String weatherSVG;

  WeatherModel weatherModel = WeatherModel();
  static const weatherIconURL = 'https://openweathermap.org/img/wn/';

  @override
  void initState() {
    // implement initState
    super.initState();
    getLocationData();
    _isLoading = true;
    loadModel().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  getLocationData() async {
    var weatherData = await weatherModel.getLocationWeather();
    setState(() {
      humidity = weatherData['main']['humidity'];
      country = weatherData['sys']['country'];
      city = weatherData['name'];
      weatherIcon = weatherData['weather'][0]['icon'];
      wind_speed = weatherData['wind']['speed'];
      double temp = weatherData['main']['temp'];
      desc = weatherData['weather'][0]['description'];
      temperature = temp.toInt();
      //print(city);
      print(weatherIcon);
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      labels: "assets/labels.txt",
      model: "assets/model_unquant.tflite",
    );
  }

  chooseImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _isLoading = true;
      _image = image;
    });
    runModelOnImage(image);
  }

  runModelOnImage(PickedFile image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 15,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.5);
    setState(() {
      _isLoading = false;
      _output = output;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isRecentLoad = true;
        _isAdding = true;
      });
      Provider.of<Disease>(context).findRecentSearch().then((_) {
        _isRecentLoad = false;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        _isAdding = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    Color elevatedBtnColor = HexColor('70EE9C');
    //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    final diseaseData = Provider.of<Disease>(context);

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: new Text(
                "Are You Sure?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: new Text("You are about to Log Out!"),
              actions: <Widget>[
                new FlatButton(
                  color: Colors.white,
                  child: new Text(
                    "Close",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                new FlatButton(
                  color: Colors.white,
                  child: new Text(
                    "Log Out",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return /* FutureBuilder<FirebaseApp>(
      // Initialize FlutterFire:
      future: _initialization,
      // ignore: missing_return
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return  */
        WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: PlantoBar()),
        body: /* _isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  )
                :  */
            SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*  Container(
                          alignment: Alignment.center,
                          child:  */
              _image == null
                  ? Column(
                      children: [
                        WeatherTile(
                          weatherIcon: weatherIcon,
                          temperature: temperature,
                          desc: desc,
                          humidity: humidity,
                          city: city,
                          country: country,
                          windSpeed: wind_speed,
                        ),
                        diseaseData.diseases.length == 0
                            ? Container(
                                child: CupertinoActivityIndicator(),
                              )
                            : RecentCarousel(diseaseData: diseaseData),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TestScreen_MarketGrid(products: products),
                      ],
                    )
                  : TestScreenImage(image: _image),
              Padding(
                padding: EdgeInsets.all(10),
                child: _output == null
                    ? Text("")
                    : Column(
                        children: [
                          Text(
                            "${_output[0]["label"]}",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: elevatedBtnColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DiseaseData(
                                  value: "${_output[0]["label"]}",
                                  img: File(_image.path),
                                ),
                                transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) =>
                                    ScaleTransition(
                                  scale: animation,
                                  child: child,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.13,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Info',
                                    style: TextStyle(
                                        color: HexColor('145E2E'),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.keyboard_arrow_right_rounded,
                                      color: HexColor('145E2E'))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            'Test Sample',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          foregroundColor: HexColor('145E2E'),
          backgroundColor: HexColor('70EE9C'),
          icon: Icon(Icons.local_florist),
          onPressed: () {
            chooseImage();
          },
        ),
      ),
    );
    /*  },
    ); */
  }
}
