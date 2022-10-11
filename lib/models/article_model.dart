class ArticleModel {
  final String title;

  final String? description;

  final String url;

  final String? urlToImage;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});
  factory ArticleModel.fromDate(Map<String , dynamic>json){
    return ArticleModel(
      title: json[
        "title"
      ],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
    );
  }

}
