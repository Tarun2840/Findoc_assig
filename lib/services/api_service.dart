import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ApiService {
  static const String baseUrl = 'https://picsum.photos';

  Future<List<ImageModel>> fetchImages({int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/v2/list?limit=$limit'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList
            .map((json) => ImageModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load images: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}