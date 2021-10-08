import '/src/data/models/article_model.dart';

class BreakingNewsResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  BreakingNewsResponseModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
      status: json['status'].toString() ,
      totalResults: json['totalResults'] ,
      articles: List<ArticleModel>.from(
        (json['articles'] as List<dynamic>).map(
          (e) => ArticleModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
