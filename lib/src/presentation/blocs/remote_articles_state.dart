part of 'remote_articles_bloc.dart';

abstract class RemoteArticlesState{
  final List<Article> ?articles;
  final bool ?noMoreData;
  final DioError? error;

  const RemoteArticlesState({this.articles, this.noMoreData, this.error});

}
class RemoteArticleStateInitial extends RemoteArticlesState {}

class RemoteArticlesLoading extends RemoteArticlesState {
  RemoteArticlesLoading() : super(noMoreData:  false);
}

class RemoteArticlesDone extends RemoteArticlesState {
  RemoteArticlesDone(List<Article> articles, bool noMoreData)
      : super(articles: articles, noMoreData: noMoreData);
}

class RemoteArticlesError extends RemoteArticlesState {
  RemoteArticlesError(DioError error) : super(error: error);
}
