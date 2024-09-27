import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPagePortraitLayout extends StatefulWidget {
  const ContactPagePortraitLayout({super.key});

  @override
  _ContactPagePortraitLayoutState createState() =>
      _ContactPagePortraitLayoutState();
}

class _ContactPagePortraitLayoutState extends State<ContactPagePortraitLayout> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '+1 123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '123 Main Street, San Francisco, CA 94103',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'info@classiceats.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Find Us Here:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Google Map
            Expanded(
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
