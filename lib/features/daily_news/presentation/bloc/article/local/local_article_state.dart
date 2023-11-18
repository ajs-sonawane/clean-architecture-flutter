import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  // final DioException? error;

  const LocalArticleState({this.articles});

  @override
  List<Object?> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

// class LocalArticleError extends LocalArticleState {
//   const LocalArticleError(DioException error) : super(error: error);
// }
