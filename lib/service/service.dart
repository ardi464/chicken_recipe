import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/recipe.dart';

class ServiceRecipe {
  static const String url = 'http://10.0.2.2/resep/api/all_recipes';

  static Future<List<Recipe>> getRecipe() async {
    try {
      final response = await http.get(url);
      List<Recipe> list = parseRecipe(response.body);
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }

  static List<Recipe> parseRecipe(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }
}
