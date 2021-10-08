import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app_clean_architecture/src/core/params/article_request.dart';
import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/core/bloc/bloc_with_state.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/domain/usacases/get_articles_usecase.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase) : super(RemoteArticlesLoading()){
    on<RemoteArticlesEvent>(_onEvent);
  }

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  void _onEvent(RemoteArticlesEvent event, Emitter<RemoteArticlesState> emit) {
    if (event is GetArticles) return _getBreakingNewsArticle(event, emit);

  }






  void _getBreakingNewsArticle( RemoteArticlesEvent event, Emitter<RemoteArticlesState> emit)async {
    print("_getBreakingNewsArticle");

      print("burda1");
      final dataState = await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));
      print("burda2");

      if(dataState.data!.isNotEmpty){

        if(dataState is DataSuccess){

          final articles = dataState.data;
          final noMoreData = articles!.length < _pageSize;
          _articles.addAll(articles);
          print("Bitti mi: "+noMoreData.toString());
          _page = _page + 1;
          emit(RemoteArticlesDone(_articles, noMoreData)) ;

        }
      }

      if(dataState is DataFailed){
        emit (RemoteArticlesError(dataState.error!) );
      }

  }

}
