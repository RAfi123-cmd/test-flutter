import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DaftarBukuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
      ),
      body: FutureBuilder<List<Book>>(
        future: fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Failed to load books');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No books available');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].author),
                  // You can add more information here
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books'));

    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data'] ?? [];

      return data.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}

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
      subtitle: json['subtitle'],
      author: json['author'],
      published: json['published'],
      publisher: json['publisher'],
      pages: json['pages'],
      description: json['description'],
      website: json['website'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
