class Professional {
  final String title;
  final String name;
  final String price;
  final String location;
  final String image;
  bool isFavorite;

  Professional({
    required this.title,
    required this.name,
    required this.price,
    required this.location,
    required this.image,
    this.isFavorite = false,
  });
}
