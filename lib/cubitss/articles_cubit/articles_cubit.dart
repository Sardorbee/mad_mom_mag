import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/articles_model/filed_keys.dart';

import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/repositories/articles_repo.dart';

part 'articles_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({required this.articlesRepository})
      : super(
          ArticleState(
            articlesModel: ArticlesModel(
                artId: 0,
                image: '',
                hashtag: '',
                title: '',
                description: '',
                likes: '',
                views: '',
                addDate: DateTime(2023),
                username: '',
                avatar: '',
                profession: '',
                userId: 0),
            articles: const [],
          ),
        ) {
    getArticles();
  }

  final ArticlesRopsitory articlesRepository;

  createArticle() async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await articlesRepository.createArticles(state.articlesModel);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "Article_added",
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  updateArticle(BuildContext context, int id) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await articlesRepository.updateArticles(state.articlesModel, id);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "Article_updated",
        ),
      );
    } else {
      // showErrorMessage(message: response.error, context: context);
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getArticles() async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));

    UniversalData response = await articlesRepository.getArticles();

    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "Load_Articles",
          articles: response.data as List<ArticlesModel>,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getArticleById(int id) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response = await articlesRepository.getArticlesById(id);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "get_website_by_id",
          articleDetail: response.data as ArticlesModel,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  updateArticleField({
    required ArticleFieldKeys fieldKey,
    required dynamic value,
  }) {
    ArticlesModel currentArticle = state.articlesModel;

    switch (fieldKey) {
      case ArticleFieldKeys.title:
        {
          currentArticle = currentArticle.copyWith(title: value as String);
          break;
        }
      case ArticleFieldKeys.description:
        {
          currentArticle =
              currentArticle.copyWith(description: value as String);
          break;
        }

      case ArticleFieldKeys.image:
        {
          currentArticle = currentArticle.copyWith(image: value as String);
          break;
        }case ArticleFieldKeys.hashtag:
        {
          currentArticle = currentArticle.copyWith(hashtag: value as String);
          break;
        }
    }

    debugPrint("Article: ${currentArticle.toString()}");

    emit(state.copyWith(articlesModel: currentArticle));
  }

  bool canRegister() {
    ArticlesModel article = state.articlesModel;

    return article.title.isNotEmpty &&
        article.image.isNotEmpty &&
        article.description.isNotEmpty;
  }
}
