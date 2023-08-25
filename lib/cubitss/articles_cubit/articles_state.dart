part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesError extends ArticlesState {
  final String errorText;
  ArticlesError({required this.errorText});
}

final class ArticlesLoaded extends ArticlesState {
  final List<dynamic> articles;

  ArticlesLoaded({required this.articles});
}
