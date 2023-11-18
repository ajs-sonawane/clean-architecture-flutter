import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "article")
class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {int? id,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content})
      : super(
            id: id,
            description: description,
            publishedAt: publishedAt,
            url: url,
            urlToImage: urlToImage,
            content: content,
            author: author,
            title: title);

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      title: map["title"].toString(),
      content: map["content"].toString(),
      publishedAt: map["publishedAt"].toString(),
      urlToImage: map["urlToImage"].toString(),
      url: map["url"].toString(),
      description: map["description"].toString(),
      author: map["author"].toString(),
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity article) {
    return ArticleModel(
        id: article.id,
        description: article.description,
        publishedAt: article.publishedAt,
        url: article.url,
        urlToImage: article.urlToImage,
        content: article.content,
        author: article.author,
        title: article.title);
  }
}
