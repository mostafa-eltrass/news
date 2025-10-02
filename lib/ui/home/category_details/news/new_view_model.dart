import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';

class NewViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;
  void getNewsBySourceId(String sourceId)async{
    newsList= null;
    errorMessage= null;
    notifyListeners();
    try{
    var response = await  ApiManager.getNewsBySourceId(sourceId);
    if(response?.status== 'error'){
   errorMessage = response!.message!;
    }else{
      newsList = response!.articles!;
    }
    }catch(e){
   errorMessage = e.toString();
    }
    notifyListeners();
  }
}