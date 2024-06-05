
// import 'package:latlong2/latlong.dart';
// import 'package:map/map.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'dart:math' as math;
// import 'package:latlong2/latlong.dart';


class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  // final MapController _controller = MapController(
  //   location: LatLng(0, 0), // Example coordinates for Detroit
  //   zoom: 15,
  // );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, // Align from the start top
            children: [
              Expanded(
                child: _buildContactInfo(
                  icon: Icons.location_on,
                  label: 'Address',
                  info: 'MASH Detroit building, 14711 Mack Ave., Detroit, MI 48214',
                ),
              ),
              Expanded(
                child: _buildContactInfo(
                  icon: Icons.phone,
                  label: 'Phone',
                  info: '123 - 456 7890 / 123 - 456 7891',
                ),
              ),
              Expanded(
                child: _buildContactInfo(
                  icon: Icons.email,
                  label: 'Email',
                  info: 'contact@company.com',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 200,
          // child: MapLayout(
          //   // controller: _controller,
          //   builder: (context, transformer) {
          //     return Stack(
          //       children: [
          //         TileLayer(
          //           builder: (context, x, y, z) {
          //             final tilesInZoom = math.pow(2.0, z).floor();

          //             while (x < 0) {
          //               x += tilesInZoom;
          //             }
          //             while (y < 0) {
          //               y += tilesInZoom;
          //             }

          //             x %= tilesInZoom;
          //             y %= tilesInZoom;

          //             final url = 'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

          //             return CachedNetworkImage(
          //               imageUrl: url,
          //               fit: BoxFit.cover,
          //             );
          //           },
          //         ),
          //         // MarkerLayerOptions(
          //         //   markers: [
          //         //     Marker(
          //         //       point: LatLng(0, 0),
          //         //       builder: (ctx) => const Icon(
          //         //         Icons.location_on,
          //         //         size: 40.0,
          //         //         color: Colors.red,
          //         //       ),
          //         //     ),
          //         //   ],
          //         // ),
          //       ],
          //     );
          //   },
          // ),
        ),
      ],
    );
  }

  Widget _buildContactInfo({required IconData icon, required String label, required String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 231, 244, 241),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color.fromARGB(255, 58, 140, 129), size: 30.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1E3954),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add horizontal padding
          child: Text(
            info,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
