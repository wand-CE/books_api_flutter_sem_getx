import '../models/book_model.dart';
import '../services/nyt_api_service.dart';

class BookApiController {
  final _nytApiService = NytApiService();

  Future<List<BookModel>> getBooks() async {
    return await _nytApiService.fetchBooks();
  }
}
