import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';

class ListEquipements extends StatelessWidget {
  final List<Equipement> equipements;
  final List<Equipement> selectedEquipements;
  final Function(Equipement) onEquipementSelected;

  const ListEquipements({
    required this.equipements,
    required this.selectedEquipements,
    required this.onEquipementSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color accentColor = Theme.of(context).colorScheme.secondary;

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: equipements.map((equipement) {
        final isSelected = selectedEquipements.contains(equipement);
        return FilterChip(
          label: Text(equipement.name),
          selected: isSelected,
          onSelected: (selected) {
            onEquipementSelected(equipement);
          },
          selectedColor: accentColor,
          backgroundColor: Colors.grey[200],
        );
      }).toList(),
    );
  }
}
