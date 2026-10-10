import '../models/tour.dart';

const tours = [
  Tour(
    id: 1,
    title: 'Norway Fjord Cruise',
    description:
        'Sail between steep mountains and deep blue water. The trip includes '
        'a boat cruise, a hike to the viewpoint and a local lunch.',
    image: 'assets/images/fjord.jpg',
    category: 'Sea',
    price: 650,
  ),
  Tour(
    id: 2,
    title: 'Forest Waterfall Hike',
    description:
        'A one-day hike through a green forest to a huge waterfall. '
        'Suitable for beginners, a guide and a picnic are included.',
    image: 'assets/images/waterfall.jpg',
    category: 'Hiking',
    price: 120,
  ),
  Tour(
    id: 3,
    title: 'Bavarian Castle Tour',
    description:
        'Visit a fairytale castle on a hill, walk around the old town and '
        'taste traditional food. Transport from the city is included.',
    image: 'assets/images/castle.jpg',
    category: 'City',
    price: 210,
  ),
  Tour(
    id: 4,
    title: 'Himalaya Winter Camp',
    description:
        'Three days in a snow camp near the high mountains. Warm tents, '
        'hot meals and an experienced mountain guide.',
    image: 'assets/images/camp.jpg',
    category: 'Mountains',
    price: 890,
  ),
];
