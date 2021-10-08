import 'package:news_app_clean_architecture/src/data/models/source_model.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/source.dart';

class ArticleModel extends Article {
  ArticleModel(
     int id,
    {required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content})
      : super(
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content);

  factory ArticleModel.fromJson(Map<String, dynamic> map){
      print("ÇAlıştı");
      return ArticleModel(
          DateTime.now().millisecondsSinceEpoch,
          source:  SourceModel.fromJson( map ['source'] as Map<String,dynamic>),
          author: map['author'].toString() ,
          title : map['title'].toString() ,
          description : map['description'].toString() ,
          url : map['url'].toString(),
          urlToImage : map['urlToImage'].toString() ,
          publishedAt : map['publishedAt'].toString() ,
          content : map['content'].toString() ,
      );

  }
}
