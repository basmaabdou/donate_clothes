import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/constants.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_text_form_field..dart';
import '../donate_clothes_details_screen/donate_clothes_details.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  TextEditingController addressController = TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.0443879, 31.2357257),
    zoom: 12,
  );

  @override
  void dispose() {
    // Cleanup the controller when the widget is disposed
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 530,
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
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
                      final addresses = await placemarkFromCoordinates(
                          latLng.latitude, latLng.longitude);
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Column(
                children: [
                  Text(
                    'Pickup Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 52,
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address must not be empty';
                        }
                        return null;
                      },
                      onTap: () {},
                      decoration: InputDecoration(
                        hintText: 'Al Haram Street',
                        hintStyle: TextStyle(
                          color: Color(0xff323232),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffFFFFFF)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Color(0xffC4C4C4),
                        ),
                        suffixIcon: InkWell(
                          child: Icon(Icons.wrong_location),
                          onTap: () {
                            addressController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 315,
                    height: 40,
                    decoration: BoxDecoration(
                        color: controller2.app,
                        borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                      onPressed: () {
                        String selectedAddress =
                            addressController.text; // Get the selected address
                        navigateTo(context,
                            DonateClothesDetails(address: selectedAddress));
                      },
                      child: Text(
                        'I’m here',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            )
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
        addressController.text =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
      } else {
        addressController.text = 'No address found';
      }
    });
  }
}
