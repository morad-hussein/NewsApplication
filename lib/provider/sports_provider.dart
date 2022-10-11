import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SportsProvider extends ChangeNotifier {

  List<ArticleModel> sportList = [];

  SportsProvider(){
    getAllSportsNews();
  }


  Future getAllSportsNews() async {
    var response =await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=9049eb51fa5f470baa629aeddc4b5e25");


    sportList = List<ArticleModel>.from(response.data["articles"].map((x)=>ArticleModel.fromDate(x)));

  }

}
/*
https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=9049eb51fa5f470baa629aeddc4b5e25

 List<ArticleModel> breakingNewsList = [];

  BreakingNewsProvider(){
    getAllBreakingNews();
  }


  Future getAllBreakingNews() async {

   try{
     var response = await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=528ffbdf133743068c1f707628d85a37");
     breakingNewsList = List<ArticleModel>.from(response.data["articles"].map((x)=>ArticleModel.fromDate(x)));
   }catch(error){
     print(error);
   }

  }




 */