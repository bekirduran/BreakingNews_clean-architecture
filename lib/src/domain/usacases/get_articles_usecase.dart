import '/src/core/params/article_request.dart';
import '/src/core/resources/data_state.dart';
import '/src/core/usecases/usecase.dart';
import '/src/domain/entities/article.dart';
import '/src/domain/repositories/articles_repository.dart';

class GetArticlesUseCase implements UseCase<DataState<List<Article>>,ArticlesRequestParams> {
 final ArticlesRepository _articlesRepository;


 GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({ required ArticlesRequestParams params})  {
 print("GetArticlesUseCase");
   return _articlesRepository.getBreakingNewsArticles(params);
  }

}