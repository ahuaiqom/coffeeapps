class Coffee {
  final String name;
  final String category; // ubah dari "type" agar seragam
  final String image;
  final double price;
  final double rating;
  final int reviews;
  final String description;

  Coffee({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
  });
}
