import 'package:flutter/material.dart';

import '../controllers/book_api_controller.dart';
import '../models/book_model.dart';
import 'my_widgets/book_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final BookApiController _bookApiController = BookApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Livros mais Populares',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: FutureBuilder(
        future: _bookApiController.getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString().replaceFirst("Exception:", ""),
              ),
            );
          } else if (snapshot.hasData) {
            final booksList = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final currentBook = booksList[index];
                return BookTile(
                  bookTitle: currentBook.title,
                  bookDescription: currentBook.description,
                  bookCoverPath: currentBook.cover,
                  buttonFunction: () => Navigator.pushNamed(
                      context, '/bookDetailPage',
                      arguments: {
                        'bookTitle': currentBook.title,
                        'bookDescription': currentBook.description,
                        'bookCover': currentBook.cover,
                        'bookLink': currentBook.bookLink,
                      }),
                );
              },
              itemCount: booksList.length,
            );
          } else {
            return Center(child: Text('Nenhum livro disponível'));
          }
        },
      ),
    );
  }
}
