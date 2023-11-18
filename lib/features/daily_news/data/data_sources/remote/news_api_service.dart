import 'package:clean_architecture_news_app_demo/core/constants/constants.dart';
import 'package:clean_architecture_news_app_demo/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apikey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
