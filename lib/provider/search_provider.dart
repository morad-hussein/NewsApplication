import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SearchProvider extends ChangeNotifier {


  List<ArticleModel> searchList = [];


  Future getAllSearchArticle(String value) async {

    try{
      var response = await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=528ffbdf133743068c1f707628d85a37&q=$value"

      );
      searchList = List<ArticleModel>.from(response.data["articles"].map((x)=>ArticleModel.fromDate(x)));
    }catch(error){
      print(error);
    }

  }
  }
/*
https://newsapi.org/v2/top-headlines?country=eg&apiKey=528ffbdf133743068c1f707628d85a37&q=
 */
/*
https://newsapi.org/v2/top-headlines?country=eg&apiKey=d05c5b2757924f5fa4c7e61da50f3c59&q=
 */