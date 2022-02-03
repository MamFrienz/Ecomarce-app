import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/providers/checkoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
// _latLng is _initialcameraposition //
  LatLng _latLng = LatLng(20.86382, 88.15638);
  late GoogleMapController googleMapController;
  Location _location = Location();
  void _onMapCreated(GoogleMapController _value) {
    googleMapController = _value;
    _location.onLocationChanged.listen((event) {
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(event.latitude!.toDouble(), event.longitude!.toDouble()),
          zoom: 20,
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _latLng,
                    //tilt: 0.0,
                    //zoom: 0.0,
                    //bearing: 0.0,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            right: 60, left: 10, bottom: 40, top: 40),
                        child: MaterialButton(
                            onPressed: () async {
                              await _location.getLocation().then((value) {
                                setState(() {
                                  checkOutProvider.selectLocation = value;
                                });
                              });
                              Navigator.of(context).pop();
                            },
                            color: primaryColor,
                            child: Text("Set Destination Area"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )))),
              ],
            ),
          ),
        ));
  }
}
