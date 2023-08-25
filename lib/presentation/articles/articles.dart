import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/presentation/articles/widget/add_article.dart';
import 'package:mad_mom_mag/presentation/articles/widget/mason_grid_view.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/add_website.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/mason_grid_view.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/utils/server_error_page.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ArticleCubit>().getArticles();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'Articles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          BlocConsumer<ArticleCubit, ArticleState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == FormStatus.success) {
                return Stack(
                  children: [
                    GlobalMasonArticles(articles: state.articles),

                  ],
                );
              } else if (state.status == FormStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == FormStatus.failure) {
                return Center(child: Text(state.statusText));
              } else {
                return const Center(
                  child: ErrorServerPage(),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: 'article ADD',
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddArticle(),
                      ));
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
