import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/source_response.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var respomseBody = response.body; //todo: string   عشان البضي هنا استرنج
      var json = jsonDecode(respomseBody); // todo : json
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
