import 'package:coworking_space_mobile/features/widgets/home_benefits_section.dart';
import 'package:coworking_space_mobile/features/widgets/home_services_section.dart';
import 'package:coworking_space_mobile/features/widgets/space_list.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/services/space_service.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';

class ServicesScreen extends StatelessWidget {
  final SpaceService _spaceService = SpaceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Space>>(
        future: _spaceService.fetchSpaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load spaces'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No spaces available'));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ServicesSection(),
                  const SizedBox(height: 24),
                  SpacesList(spaces: snapshot.data!), // Corrected placement
                  const SizedBox(height: 24),
                  const BenefitsSection(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
