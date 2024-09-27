import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPageLandscapeLayout extends StatefulWidget {
  const ContactPageLandscapeLayout({super.key});

  @override
  _ContactPageLandscapeLayoutState createState() =>
      _ContactPageLandscapeLayoutState();
}

class _ContactPageLandscapeLayoutState
    extends State<ContactPageLandscapeLayout> {
  late GoogleMapController mapController;

  final LatLng _restaurantLocation =
      const LatLng(6.939557747114729, 79.85575546661137); // Example coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Contact details on the left side
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '+1 123-456-7890',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Address:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '76/5 New Moor Street, Colombo 12',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'info@classiceats.com',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Find Us Here:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Google Map on the right side
            Expanded(
              flex: 2,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _restaurantLocation,
                  zoom: 14.0,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('restaurant'),
                    position: _restaurantLocation,
                    infoWindow: const InfoWindow(
                      title: 'Classic Eats',
                      snippet: '76/5 New Moor Street, Colombo 12',
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
