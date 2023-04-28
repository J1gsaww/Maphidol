import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final CameraPosition initialCameraPosition;

  MapScreen(
      {required this.initialCameraPosition,
      required int currentPageIndex,
      required GlobalKey key,
      required LatLng markerPosition});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  late ValueNotifier<int> _currentPageIndexNotifier;

  @override
  void initState() {
    super.initState();
    _currentPageIndexNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _currentPageIndexNotifier.dispose();
    super.dispose();
  }

  LatLng _getLatLngForPageIndex(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return LatLng(13.790721916922067,
            100.32222521170648); // Marker position for page 0
      case 1:
        return LatLng(13.790447250864132,
            100.32216224964785); // Marker position for page 1
      case 2:
        return LatLng(13.78897737843187,
            100.32481491586893); // Marker position for page 2
      case 3:
        return LatLng(13.792072962347906,
            100.32028008697498); // Marker position for page 3
      case 4:
        return LatLng(14.071927651542431,
            100.60304105588834); // Marker position for page 4
      default:
        return LatLng(
            13.793228247926843, 100.32059445588742); // Default marker position
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentPageIndexNotifier,
        builder: (context, currentPageIndex, _) {
          final markers = Set<Marker>.of([
            Marker(
              markerId: MarkerId('myMarker'),
              position: _getLatLngForPageIndex(currentPageIndex),
            ),
          ]);

          return GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
            },
            initialCameraPosition: widget.initialCameraPosition,
            markers: markers,
          );
        },
      ),
    );
  }
}
