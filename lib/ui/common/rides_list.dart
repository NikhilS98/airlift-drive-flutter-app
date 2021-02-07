import 'dart:convert';

import 'package:airlift_drive/common/drive_api_constants.dart';
import 'package:airlift_drive/models/location_details.dart';
import 'package:airlift_drive/models/mock_response.dart';
import 'package:airlift_drive/models/ride.dart';
import 'package:airlift_drive/ui/ride_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../create_ride.dart';

class RidesList extends StatelessWidget {

  RidesList({Key key, @required this.rides,
    @required this.origin,
    @required this.destination,
    @required this.distance,
    @required this.duration}): super(key: key);

  final List<Ride> rides;
  final LocationDetails origin, destination;
  final num distance, duration;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: rides.length,
          itemBuilder: (BuildContext context, int index) {
            var ride = rides[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RideDetails(ride: ride,)));
                  },
                  title: Container(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('${ride.driver.firstName} ${ride.driver.lastName}')),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Origin: ${ride.origin}'),
                        Text('Destination: ${ride.destination}'),
                        Text('Start Time: ${ride.startTime}'),
                        Text('End Time: ${ride.endTime}'),
                        Text('Max Passengers: ${ride.maxPassengers}'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

