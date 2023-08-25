import 'package:bloc/bloc.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/repositories/articles_repo.dart';
import 'package:meta/meta.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.articlesRopsitory}) : super(ArticlesInitial()) {
    getArticles();
  }
  final ArticlesRopsitory articlesRopsitory;

  Future<void> getArticles() async {
    emit(ArticlesLoading());
    UniversalData universalData = await articlesRopsitory.getArticles();
    if (universalData.error.isEmpty) {
      emit(ArticlesLoaded(articles: universalData.data));
    } else {
      emit(ArticlesError(errorText: universalData.error));
    }
  }
}
