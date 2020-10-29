import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Location {
  double latitude;
  double longitude;
  var addresses;
  var first;
  Future<String> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
      final coordinates = new Coordinates(latitude, longitude);
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      first = addresses.first;
      print(first.adminArea);
      return first.adminArea;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
