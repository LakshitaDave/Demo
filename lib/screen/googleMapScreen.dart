import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const position = LatLng(26.252684, 72.997594);
  static const position2 = LatLng(26.254573, 72.997598);

  List<LatLng> polylineCoordinates=[];

  void getPolyPoints() async {
    PolylinePoints polyPoints = PolylinePoints();
    PolylineResult result = await polyPoints.getRouteBetweenCoordinates(googleApiKey: "AIzaSyBoolg1ilRP4a3ULYuivIVdpt9nDUf6fcU",
        request: PolylineRequest(origin: PointLatLng(position.latitude,position.longitude),
            destination: PointLatLng(position2.latitude,position2.longitude), mode: TravelMode.driving));

    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {

    });
  }

  @override
  void initState(){
    super.initState();
    getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: position,
          zoom: 15,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: polylineCoordinates,
            color: Colors.blueGrey,
            width: 6
          ),
        },
        markers: {
           const Marker(
              markerId: MarkerId('sourceLocation'),
              icon: BitmapDescriptor.defaultMarker,
            position: position,
            infoWindow: InfoWindow(
              title: 'microlent ',
              snippet: 'description sndkajfkjsdbfkj jhbsd hsvdjw '
            )
          ),const Marker(
              markerId: MarkerId('destinationLocation'),
              icon: BitmapDescriptor.defaultMarker,
            position: position2,
          ),
        },
      ),
    );
  }
}


