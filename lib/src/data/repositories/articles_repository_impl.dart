import 'dart:io';
import 'package:dio/dio.dart';

import '/../src/core/params/article_request.dart';
import '/../src/core/resources/data_state.dart';
import '/../src/data/datasources/remote/news_api_service.dart';
import '/../src/domain/entities/article.dart';
import '/../src/domain/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params) async {
    try {
      print("Burada ArticlesRepositoryImpl");
      print("${params.pageSize} + ${params.page} + ${params.country} + ${params.apiKey} + ${params.category}");

      final httpResponse = await _newsApiService.getBreakingNewsArticles(
          apiKey: params.apiKey,
          category: params.category,
          country: params.country,
          page: params.page,
          pageSize: params.pageSize);

      print("BURDA"+httpResponse.data.articles.first.title);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response));
    } on DioError catch (e) {
      print("catchhhh!!!!!!!!!!!!!!!");
      return DataFailed(e);
    }
  }
}
