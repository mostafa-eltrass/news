import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/source_response.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category' : categoryId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body; //todo: string   عشان البضي هنا استرنج
      var json = jsonDecode(responseBody); // todo : json
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=717cddcf38c94830a366ac8a037e2d44
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
       var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    
    return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
   
  }
}
