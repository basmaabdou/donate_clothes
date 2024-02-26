import 'dart:async';

import 'package:donate_clothes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Try extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.0443879, 31.2357257),
    zoom: 12,
  );

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    // Cleanup the controller when the widget is disposed
    addressController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 530,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: Try._kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (CameraPosition position) {
                _getAddress(position.target);
              },
              markers: markers,
              onTap: (LatLng latLng) async {

                markers.add(
                  Marker(
                    markerId: MarkerId("1"),
                    position: LatLng(latLng.latitude, latLng.longitude),
                  ),
                );
                final addresses =
                await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
                if (addresses.isNotEmpty) {
                  final address = addresses.first;
                  addressController.text = address.street.toString();
                }
                setState(() {});
              },
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: defaultColor,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _getAddress(LatLng position) async {
    final List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks[0];
        addressController.text = '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
      } else {
        addressController.text = 'No address found';
      }
    });
  }
}

