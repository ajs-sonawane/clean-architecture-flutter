import 'package:clean_architecture_news_app_demo/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:get_it/get_it.dart';

// sl > service locator
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  sl.registerSingleton<AppDatabase>(database);

  //Dio ..
  sl.registerSingleton<Dio>(Dio());

  // dependencies ...
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // UseCases ..
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  // BLOCs ..
  /// here we need new instances every time app loads.
  /// Therefore used registerFactory()
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticlesBloc>(
      () => LocalArticlesBloc(sl(), sl(), sl()));
}
