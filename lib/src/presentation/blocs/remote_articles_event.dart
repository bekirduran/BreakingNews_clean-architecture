part of 'remote_articles_bloc.dart';

@immutable
abstract class RemoteArticlesEvent extends Equatable {
  RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  GetArticles();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
