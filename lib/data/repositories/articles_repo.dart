import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';
import 'package:mad_mom_mag/data/network/articles_api_service.dart';

class ArticlesRopsitory {
  final ArticlesApiService articlesApiService;

  ArticlesRopsitory({required this.articlesApiService});

  Future<UniversalData> getArticles() async => await articlesApiService.getArticles();
}
