class SourceModel {
  String id;
  String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

class ArticlesModel {
  SourceModel source;
  String author;
  String content;
  String description;
  String publishedAt;
  String title;
  String url;
  String urlToImage;

  ArticlesModel({
    required this.source,
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      source: SourceModel.fromJson(json["source"]),
      author: json['author'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
}
class ArticlesDataModel{
  List<ArticlesModel> articles;
  String status;
  int totalResults;

  ArticlesDataModel({
    required this.articles,
    required this.status,
    required this.totalResults,
  });

  factory ArticlesDataModel.fromJson(Map<String, dynamic> json) {
    List<ArticlesModel> articles = [];
    for ( Map<String,dynamic>eachNews in json['articles']) {
      articles.add(ArticlesModel.fromJson(eachNews));
    }
    return ArticlesDataModel(
      articles: articles,
      status: json['status'],
      totalResults: json['totalResults'],
    );
  }
}