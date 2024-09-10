class BookModel {
  String title;
  String description;
  String cover;
  String bookLink;

  BookModel({
    required this.title,
    required this.description,
    required this.cover,
    required this.bookLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json["title"],
      description: json["description"],
      cover: json["book_image"],
      bookLink: json["buy_links"][0]["url"] ?? '',
    );
  }
}
