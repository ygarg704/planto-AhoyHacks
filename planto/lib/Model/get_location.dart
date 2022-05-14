import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitide;
  String apiKey = 'your API key';
  int status;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
      print(longitide);
      print(latitude);
    } catch (e) {
      print(e);
    }
  }
}
