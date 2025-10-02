import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/source_response.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source>? sourceList;
  String? errorMessage;

  void getSources(String categoryId) async {

    sourceList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getSources(categoryId);

      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        sourceList = response!.sources!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}
