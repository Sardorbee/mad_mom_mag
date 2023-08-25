import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/presentation/articles/widget/article_details.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/sites_details.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class GlobalMasonArticles extends StatefulWidget {
  const GlobalMasonArticles({super.key, required this.articles});

  final List<ArticlesModel> articles;

  @override
  State<GlobalMasonArticles> createState() => _GlobalMasonArticlesState();
}

class _GlobalMasonArticlesState extends State<GlobalMasonArticles> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MasonryGridView.count(
        itemCount: widget.articles.length,
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        itemBuilder: (context, index) {
          ArticlesModel x = widget.articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetails(
                    articlesModel: x,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: "$baseUrl${x.avatar}",
                      errorWidget: (context, url, error) => const Placeholder(
                        fallbackHeight: 70,
                        fallbackWidth: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            x.title,
                            maxLines: 1,
                            style: const TextStyle(

                              overflow: TextOverflow.ellipsis,
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                  SizedBox(height: 4.h),
                  Text(
                    x.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
