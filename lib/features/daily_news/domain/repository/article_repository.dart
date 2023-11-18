import 'package:clean_architecture_news_app_demo/core/resources/data_state.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // (REMOTE) API methods ..
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // (LOCAL) database methods ..
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
