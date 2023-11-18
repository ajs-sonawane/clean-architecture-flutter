import 'package:clean_architecture_news_app_demo/core/resources/data_state.dart';
import 'package:clean_architecture_news_app_demo/core/usecase/usecase.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  late final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
