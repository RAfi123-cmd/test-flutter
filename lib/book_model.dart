class Book {
  final int id;
  final int userId;
  final String isbn;
  final String title;
  final String subtitle;
  final String author;
  final String published;
  final String publisher;
  final int pages;
  final String description;
  final String website;
  final String createdAt;
  final String updatedAt;

  Book({
    required this.id,
    required this.userId,
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      userId: json['user_id'],
      isbn: json['isbn'],
      title: json['title'],
      subtitle: json['subtitle'] ?? '',
      author: json['author'] ?? '',
      published: json['published'] ?? '',
      publisher: json['publisher'] ?? '',
      pages: json['pages'] ?? 0,
      description: json['description'] ?? '',
      website: json['website'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
