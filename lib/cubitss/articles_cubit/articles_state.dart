part of 'articles_cubit.dart';


class ArticleState extends Equatable {
  final String statusText;
  final ArticlesModel articlesModel;
  ArticlesModel? articleDetail;
  final List<ArticlesModel> articles;
  final FormStatus status;

  ArticleState({
    required this.articlesModel,
    this.articleDetail,
    this.statusText = "",
    this.status = FormStatus.pure,
    required this.articles,
  });

  ArticleState copyWith({
    String? statusText,
    ArticlesModel? articlesModel,
    ArticlesModel? articleDetail,
    List<ArticlesModel>? articles,
    FormStatus? status,
  }) =>
      ArticleState(
        articlesModel: articlesModel ?? this.articlesModel,
        articleDetail: articleDetail ?? this.articleDetail,
        articles: articles ?? this.articles,
        statusText: statusText ?? this.statusText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
    articlesModel,
    articleDetail,
    statusText,
    status,
    articles,
  ];


}