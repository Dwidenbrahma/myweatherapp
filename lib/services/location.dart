import 'package:geolocator/geolocator.dart';


class Location {

    double latitutde=0.0;
    double longitude=0.0;

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Future <void> getLocation() async {
      try {
        bool serviceEnabled;
        LocationPermission permission;
        // Check if location services are enabled
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        // Check location permission
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        // Fetch the location
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings,
        );
        latitutde = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    }



}
