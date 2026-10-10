import 'package:flutter/material.dart';

import '../data/tours.dart';
import '../models/tour.dart';
import '../widgets/tour_card.dart';

/// Tab 1: the list of all tours.
class FeedScreen extends StatelessWidget {
  final Set<int> favoriteIds;
  final void Function(Tour tour) onOpen;
  final void Function(Tour tour) onToggleFavorite;

  const FeedScreen({
    super.key,
    required this.favoriteIds,
    required this.onOpen,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final tour in tours)
          TourCard(
            tour: tour,
            isFavorite: favoriteIds.contains(tour.id),
            onTap: () => onOpen(tour),
            onFavoriteTap: () => onToggleFavorite(tour),
          ),
      ],
    );
  }
}
