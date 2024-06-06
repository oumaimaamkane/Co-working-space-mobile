import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class coPlaceSearchBar extends StatelessWidget {
  const coPlaceSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildDateField(context, label: 'Check In'),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildDateField(context, label: 'Check Out'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildDropdownField(
                    context,
                    label: 'Workspace Type',
                    items: const ['Private Office', 'Shared Space', 'Meeting Room'],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildDropdownField(
                    context,
                    label: 'Capacity',
                    items: const ['1 Person', '2 Persons', '5 Persons', '10 Persons'],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle search action
              },
              style: buttonStyle,
              child: const Text('Search'),
              // style: ElevatedButton.styleFrom(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   textStyle: const TextStyle(fontSize: 16.0),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, {required String label}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Widget _buildDropdownField(BuildContext context, {required String label, required List<String> items}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Handle dropdown value change
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Handle selected date
    }
  }
}
