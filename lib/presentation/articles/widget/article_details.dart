import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/presentation/articles/widget/update_article.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';
import 'package:mad_mom_mag/utils/server_error_page.dart';

class ArticleDetails extends StatefulWidget {
  ArticleDetails({super.key, required this.articlesModel});

  ArticlesModel articlesModel;

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  void initState() {
    context.read<ArticleCubit>().getArticleById(widget.articlesModel.artId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Article Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocConsumer<ArticleCubit, ArticleState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == FormStatus.success) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: CachedNetworkImage(
                            imageUrl: "$baseUrl${state.articleDetail!.avatar}"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        widget.articlesModel.title,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        state.articleDetail!.profession,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        state.articleDetail!.username,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                          child: Text(
                            state.articleDetail!.description,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateArticle(
                              articlesModel: state.articleDetail!,
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: ErrorServerPage(),
            );
          }
        },
      ),
    );
  }
}
