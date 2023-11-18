import 'package:clean_architecture_news_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleTileWidget extends StatelessWidget {
  const ArticleTileWidget({Key? key, this.article}) : super(key: key);
  final ArticleEntity? article;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      // margin: EdgeInsets.all(8),
      height: MediaQuery.sizeOf(context).width / 2.4,
      child: Row(
        children: [
          _buildImage(context),
          const SizedBox(width: 12),
          _buildTitleAndDescription(context)
        ],
      ),
    );
  }

  _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: MediaQuery.sizeOf(context).width / 3.3,
            height: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Container(
            width: MediaQuery.sizeOf(context).width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: MediaQuery.sizeOf(context).width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }

  _buildTitleAndDescription(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: [
            Text(
              article!.title ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                article!.description ?? "",
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  // fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                const Icon(Icons.timeline_outlined,
                    color: Colors.grey, size: 20),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    article!.publishedAt ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    // style: GoogleFonts.quicksand(
                    // fontWeight: FontWeight.w900,
                    // fontSize: 18,
                    // color: Colors.black87,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
