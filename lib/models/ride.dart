import 'package:airlift_drive/models/location_details.dart';
import 'package:airlift_drive/models/user.dart';

class Ride {
  Ride({
    this.id, this.origin, this.destination,
    this.startTime, this.endTime, this.maxPassengers, this.currentPassengers
  });

  int id;
  LocationDetails origin;
  LocationDetails destination;
  List<LocationDetails> route;
  DateTime startTime;
  DateTime endTime;
  int maxPassengers;
  User driver;
  double distanceFromStart, distanceFromEnd, totalDistance;
  int fare;
  String status;
  List<User> currentPassengers;

  Ride.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        origin = LocationDetails.fromJson(json['startLocation']),
        destination = LocationDetails.fromJson(json['endLocation']),
        route = (json['route']['coordinates'] as List).map((e) => LocationDetails.fromJson({"coordinates": e})).toList(),
        startTime = DateTime.parse(json['startTime']),
        endTime = json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
        maxPassengers = json['maxPassengers'],
        fare = json['perPassengerFare'],
        status = json['status'],
        driver = User.fromJson(json['driver']),
        currentPassengers = null;//(json['currentPassengers'] as List).map((e) => User.fromJson(e)).toList();
}