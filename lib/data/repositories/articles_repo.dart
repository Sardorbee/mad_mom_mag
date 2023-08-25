import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';
import 'package:mad_mom_mag/data/network/articles_api_service.dart';

class ArticlesRopsitory {
  final ArticlesApiService articlesApiService;

  ArticlesRopsitory({required this.articlesApiService});

  Future<UniversalData> getArticles() async =>
      await articlesApiService.getArticles();
  Future<UniversalData> createArticles(ArticlesModel articlesModel) async =>
      await articlesApiService.createArticle(articlesModel: articlesModel);
  Future<UniversalData> updateArticles(
          ArticlesModel articlesModel, int id) async =>
      await articlesApiService.updateArticle(
          articlesModel: articlesModel, id: id);
  Future<UniversalData> getArticlesById(int id) async =>
      await articlesApiService.getArticlesById(id);
}
