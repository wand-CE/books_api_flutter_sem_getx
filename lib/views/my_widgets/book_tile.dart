import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final String bookCoverPath;
  final String bookTitle;
  final String bookDescription;
  final VoidCallback buttonFunction;

  const BookTile({
    super.key,
    required this.bookTitle,
    required this.bookDescription,
    required this.bookCoverPath,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        tileColor: Colors.grey[300],
        leading: Image.network(
          bookCoverPath,
          width: 70,
        ),
        title: Text(
          bookTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(bookDescription),
        onTap: buttonFunction,
      ),
    );
  }
}
