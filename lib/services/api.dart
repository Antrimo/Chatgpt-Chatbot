import 'dart:convert';
import 'dart:io';
import 'package:chatbot/constant/apiconst.dart';
import 'package:chatbot/models/models.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static Future<List<Models>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$base_url/models"),
        headers: {'Authorization': 'Bearer $api_key'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }

      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
      }
      return Models.modelsFromSnapshot(temp);
    } catch (error) {
      print("error");
      rethrow;
    }
  }
}