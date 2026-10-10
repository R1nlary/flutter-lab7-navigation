# Flutter Lab 7 — Multi-Screen App with Navigation & Tabs

A travel tours app with a bottom navigation bar and a detail screen.
Topics: `Navigator.push`, `Navigator.pop`, passing data, `BottomNavigationBar`.

## Run

```bash
flutter pub get
flutter run -d chrome
```

```bash
flutter test
```

## Project structure

```
lib/
├── main.dart
├── models/tour.dart          # Tour data class
├── data/tours.dart           # 4 sample tours
├── screens/
│   ├── root_screen.dart      # BottomNavigationBar + 3 tabs
│   ├── feed_screen.dart      # Tab 1: list of tours
│   ├── favorites_screen.dart # Tab 2: saved tours
│   ├── profile_screen.dart   # Tab 3: profile and settings
│   └── detail_screen.dart    # opened with Navigator.push
└── widgets/tour_card.dart    # list item (image, title, category, price)
assets/images/                # tour photos
```

## How it works

* **Root screen** — `BottomNavigationBar` with three tabs: Feed, Favorites,
  Profile. The tabs are in an `IndexedStack`, so switching tabs does not reset
  the scroll position or the settings.
* **Feed** — four tours with an image, title, category and price.
  The heart button saves a tour.
* **Favorites** — shows the saved tours (or a hint when there are none).
  The favorites are stored in the root screen, so all tabs share them.
* **Profile** — user info, the number of saved tours and two switches.
* **Detail screen** — a tap on a tour calls `Navigator.push` and passes the
  whole `Tour` object (title, description, image, category, price) to
  `DetailScreen`.
* **Back navigation** — the AppBar back arrow and the "Back" button in the
  body both call `Navigator.pop`. The app returns to the same tab and keeps
  its state (favorites, scroll position).

Photos: [Lorem Picsum](https://picsum.photos) (Unsplash license).
