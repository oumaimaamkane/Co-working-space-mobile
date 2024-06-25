import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';

class ListServices extends StatelessWidget {
  final List<Service> services;
  final List<Service> selectedServices;
  final Function(Service) onServiceSelected;

  const ListServices({
    required this.services,
    required this.selectedServices,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color unselectedColor = Colors.grey[200]!;

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: services.map((service) {
        final isSelected = selectedServices.contains(service);
        return FilterChip(
          label: Text(service.name),
          selected: isSelected,
          onSelected: (selected) {
            onServiceSelected(service);
          },
          selectedColor: primaryColor,
          backgroundColor: unselectedColor,
          side: BorderSide(color: isSelected ? primaryColor : Colors.grey),
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        );
      }).toList(),
    );
  }
}
