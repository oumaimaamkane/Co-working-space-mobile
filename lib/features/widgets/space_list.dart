import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/features/widgets/space_card.dart';

class SpacesList extends StatefulWidget {
  final List<Space> spaces;

  SpacesList({required this.spaces});

  @override
  _SpacesListState createState() => _SpacesListState();
}

class _SpacesListState extends State<SpacesList> {
  int _currentIndex = 0;

  void _showPrevious() {
    setState(() {
      _currentIndex -= 2;
      if (_currentIndex < 0) {
        _currentIndex = 0;
      }
    });
  }

  void _showNext() {
    setState(() {
      _currentIndex += 2;
      if (_currentIndex >= widget.spaces.length) {
        _currentIndex = widget.spaces.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: (widget.spaces.length / 2).ceil(),
          itemBuilder: (context, index) {
            int firstIndex = index * 2;
            int secondIndex = index * 2 + 1;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SpaceCard(space: widget.spaces[firstIndex]),
                ),
                if (secondIndex < widget.spaces.length)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpaceCard(space: widget.spaces[secondIndex]),
                  ),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _currentIndex > 0 ? _showPrevious : null,
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: _currentIndex < widget.spaces.length - 2 ? _showNext : null,
            ),
          ],
        ),
      ],
    );
  }
}
