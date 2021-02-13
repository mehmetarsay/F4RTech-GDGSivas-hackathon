import 'dart:async';
import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  Position currentPosition;
  CameraPosition _kGooglePlex;
  String address;
  List<Position> allPositions;
  Set<Marker> markers;
  double radius=500;

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(40.9950369, 29.0638701),
      zoom: 15.4746,
    );
    markers=Set<Marker>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _kGooglePlex = CameraPosition(
                target:
                    LatLng(currentPosition.latitude, currentPosition.longitude),
                zoom: 15.4746,
              );
              return Container(
                height: Constants.getHeight(context),
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapToolbarEnabled: false,
                  circles: Set.from([
                    Circle(
                      circleId: CircleId("1"),
                      center: LatLng(
                          currentPosition.latitude, currentPosition.longitude),
                      radius: radius,
                      strokeColor: ColorTable.blue,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeWidth: 5,
                    )
                  ]),
                  markers: getMarkers(),
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

   /*Bu fonksiyon userModel'e taşınabilir*/
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    currentPosition = await Geolocator.getCurrentPosition();
    return currentPosition;
  }

  /* Adresin Latitude ve longitude değerlerini kullanarak adresin String halini döndürür */
  Future<String> getAdress(latitude,longitude) async {
    var coordinates =
        Coordinates(latitude,longitude);
    var _address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (_address != null) {
      setState(() {
        address = _address.first.addressLine;
      });
    }
    return address;
  }

  /*measure(lat1, lon1, lat2, lon2) {
    // generally used geo measurement function
    var R = 6378.137; // Radius of earth in KM
    var dLat = lat2 * pi / 180 - lat1 * pi / 180;
    var dLon = lon2 * pi / 180 - lon1 * pi / 180;
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c;
    return d * 1000; // meters
  }*/

  Set<Marker> getMarkers() {
    /*Local değişken. Veri tabanıyla bağlantı kurulduğunda değişecek */
    allPositions = [
      Position(
          longitude: currentPosition.longitude,
          latitude: currentPosition.latitude),
      Position(
          longitude: currentPosition.longitude + 0.05,
          latitude: currentPosition.latitude),
      Position(
          longitude: currentPosition.longitude + 0.001,
          latitude: currentPosition.latitude - 0.003),
      Position(
          longitude: currentPosition.longitude + 0.01,
          latitude: currentPosition.latitude-0.004),
      Position(
          longitude: currentPosition.longitude + 0.001,
          latitude: currentPosition.latitude - 0.0002)
    ];
    for(int i=0;i<allPositions.length;++i)
      {
        if(Geolocator.distanceBetween(allPositions[i].latitude, allPositions[i].longitude, currentPosition.latitude, currentPosition.longitude)<radius) {
          markers.add(Marker(markerId: MarkerId('$i'),
              position: LatLng(
                  allPositions[i].latitude, allPositions[i].longitude),onTap: (){
            return showModalBottomSheet(context: context, builder: (context){
              if(address!=null)
                {
                  address=null;
                }
              return FutureBuilder(future:getAdress(allPositions[i].latitude, allPositions[i].longitude),builder: (context,snapshot)
                {
                  if(snapshot.hasData)
                    return Center(child: Column(
                      children: [
                        Text(snapshot.data.toString()),
                        RaisedButton(child: Text('Teklif Ver'),onPressed: (){
                        },)
                      ],
                    ));
                  else
                    return Center(child:CircularProgressIndicator());
                },);
            },useRootNavigator: true);
              }));
        }
      }
    return markers;
  }
}
