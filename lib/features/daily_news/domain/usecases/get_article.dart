import 'package:clean_architecture_news_app_demo/core/resources/data_state.dart';
import 'package:clean_architecture_news_app_demo/core/usecase/usecase.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {

  late final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
