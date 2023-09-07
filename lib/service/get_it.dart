import 'package:get_it/get_it.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/user_data_cubit/userdata_cubit.dart';
import 'package:mad_mom_mag/cubitss/tab_bar_cubit/tabbar_cubit.dart';
import 'package:mad_mom_mag/cubitss/users_cubit/users_cubit.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';
import 'package:mad_mom_mag/data/network/articles_api_service.dart';
import 'package:mad_mom_mag/data/network/sites_api_service.dart';
import 'package:mad_mom_mag/data/repositories/articles_repo.dart';
import 'package:mad_mom_mag/data/repositories/auth_repo.dart';
import 'package:mad_mom_mag/data/repositories/sites_repo.dart';
import 'package:mad_mom_mag/data/repositories/users_repo.dart';

final getIt = GetIt.instance;

void getItSetup() {
  //ApiServices============================================================================================
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<ArticlesApiService>(() => ArticlesApiService());
  getIt.registerLazySingleton<SitesApiService>(() => SitesApiService());
  //Repositories============================================================================================
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<ArticlesRopsitory>(() =>
      ArticlesRopsitory(articlesApiService: getIt.get<ArticlesApiService>()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<SitesRopsitory>(
      () => SitesRopsitory(sitesApiService: getIt.get<SitesApiService>()));
}
