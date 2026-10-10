/// One travel tour. The whole object is passed to the DetailScreen.
class Tour {
  final int id;
  final String title;
  final String description;
  final String image; // path to an asset image
  final String category;
  final double price;

  const Tour({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });
}
