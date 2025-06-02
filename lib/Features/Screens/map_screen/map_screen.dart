import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // String mapBoxToken =
  //     "pk.eyJ1IjoicHNjb3R0LTUyNDgiLCJhIjoiY21iYXAzZmR6MGpoeDJpcG1ndHVoNGowNSJ9.5GNY2SJuw86ncQdcCXFyqg";

  // void setup() {
  //   MapboxOptions.setAccessToken(mapBoxToken);
  // }

  MapboxMap? mapBoxController;
  double? latitude;
  double? longitude;
  void determinePosition() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    geo.Position position = await geo.Geolocator.getCurrentPosition(
      desiredAccuracy: geo.LocationAccuracy.high,
    );
    if (!mounted) return;
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${latitude!.toString()}, ${longitude!.toString()}"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MapboxOptions.setAccessToken(
      'pk.eyJ1IjoicHNjb3R0LTUyNDgiLCJhIjoiY21iYXAzZmR6MGpoeDJpcG1ndHVoNGowNSJ9.5GNY2SJuw86ncQdcCXFyqg',
    );

    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("assets/logo/logo_kivaloop.png", width: 120),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.search_normal,
                          color: Color(0xff745340).withOpacity(0.5),
                        ),
                        hintText: "Search Coffee shop",
                        hintStyle: GoogleFonts.roboto(
                          color: Color(0xff745340).withOpacity(0.5),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff745340)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff745340)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff745340)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child:
                  (latitude != null && longitude != null)
                      ? MapWidget(
                        styleUri: MapboxStyles.DARK,
                        key: const ValueKey("mapWidget"),
                        cameraOptions: CameraOptions(
                          center: Point(
                            coordinates: Position(latitude!, longitude!),
                          ),
                          zoom: 14.0,
                        ),
                        onMapCreated: (MapboxMap controller) {
                          setState(() {
                            mapBoxController = controller;
                          });
                          // You can store the mapboxMap reference if needed for later use
                          mapBoxController?.location.updateSettings(
                            LocationComponentSettings(
                              enabled: true,
                              pulsingEnabled: true,
                            ),
                          );
                        },
                      )
                      : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
