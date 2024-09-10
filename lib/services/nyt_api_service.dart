import 'package:dio/dio.dart';
import '../models/book_model.dart';

class NytApiService {
  final dio = Dio();
  final String apiKey = 'MINHA-CHAVE-API';

  Future<List<BookModel>> fetchBooks() async {
    final String url =
        'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$apiKey';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> resultado = response.data["results"]['books'];

        return resultado.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao retornar os livros');
      }
    } catch (e) {
      print(e);
      throw Exception('Não foi possível retornar os livros');
    }
  }
}
