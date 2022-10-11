import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';


class BreakingNewsProvider extends ChangeNotifier {

  List<ArticleModel> breakingNewsList = [];

  BreakingNewsProvider(){
    getAllBreakingNews();
  }


  Future getAllBreakingNews() async {

   try{
     var response = await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=528ffbdf133743068c1f707628d85a37");
     breakingNewsList = List<ArticleModel>.from(response.data["articles"].map((x)=>ArticleModel.fromDate(x)));
     print(response.data);
   }catch(error){
     print(error);
   }

  }


}
/*
  List<CodeModel> code=[];

  CodeProvider(){
    getPost();
  }

  Future getPost() async {
    try {
      var response = await Dio().get("https://dummyjson.com/quotes");
      code = List<CodeModel>.from(response.data[ "quotes"].map((x) =>CodeModel.fromJson((x))));
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
 */