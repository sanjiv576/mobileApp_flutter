import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Position? position;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position!.latitude;
      longitude = position!.longitude;

      // print("YOur lociation is $position");
    } catch (e) {
      print(e);
    }
  }
}
