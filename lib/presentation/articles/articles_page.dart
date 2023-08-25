import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/presentation/articles/widget/article_details.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';
import 'package:mad_mom_mag/utils/server_error_page.dart';

class ArticlesData extends StatelessWidget {
  const ArticlesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        if (state.status == FormStatus.failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.statusText)));
        }
      },
      builder: (context, state) {
        if (state.status == FormStatus.success) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.articles.length,
            itemBuilder: (BuildContext context, int index) {
              ArticlesModel articlesModel = state.articles[index];

              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ArticleDetails(articlesModel: articlesModel),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.01),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 170,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.03,
                            ),
                            child: CachedNetworkImage(
                                imageUrl: "$baseUrl${articlesModel.avatar}"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.01),
                          child: Text(articlesModel.title),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.01),
                          child: Text(
                            articlesModel.description,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state.status == FormStatus.failure) {
          return Center(
            child: Text(state.statusText),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
