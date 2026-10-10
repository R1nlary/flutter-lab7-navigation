import 'package:flutter/material.dart';

import '../models/tour.dart';
import 'detail_screen.dart';
import 'favorites_screen.dart';
import 'feed_screen.dart';
import 'profile_screen.dart';

/// The root screen: three tabs and a BottomNavigationBar.
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  // Favorites are stored here, so all three tabs see the same data.
  final Set<int> favoriteIds = {};

  void toggleFavorite(Tour tour) {
    setState(() {
      if (favoriteIds.contains(tour.id)) {
        favoriteIds.remove(tour.id);
      } else {
        favoriteIds.add(tour.id);
      }
    });
  }

  void openDetail(Tour tour) {
    // Navigator.push opens the DetailScreen and passes the whole object.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          tour: tour,
          isFavorite: favoriteIds.contains(tour.id),
          onToggleFavorite: toggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const titles = ['Feed', 'Favorites', 'Profile'];

    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex])),
      // IndexedStack keeps every tab alive, so the scroll position and
      // the switches are not reset when you change the tab.
      body: IndexedStack(
        index: currentIndex,
        children: [
          FeedScreen(
            favoriteIds: favoriteIds,
            onOpen: openDetail,
            onToggleFavorite: toggleFavorite,
          ),
          FavoritesScreen(
            favoriteIds: favoriteIds,
            onOpen: openDetail,
            onToggleFavorite: toggleFavorite,
          ),
          ProfileScreen(favoritesCount: favoriteIds.length),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Feed'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
