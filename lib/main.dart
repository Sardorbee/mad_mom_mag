import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/user_data_cubit/userdata_cubit.dart';
import 'package:mad_mom_mag/cubitss/tab_bar_cubit/tabbar_cubit.dart';
import 'package:mad_mom_mag/cubitss/users_cubit/users_cubit.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/data/local/shared_prefs.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';
import 'package:mad_mom_mag/data/network/articles_api_service.dart';
import 'package:mad_mom_mag/data/network/sites_api_service.dart';
import 'package:mad_mom_mag/data/repositories/articles_repo.dart';
import 'package:mad_mom_mag/data/repositories/auth_repo.dart';
import 'package:mad_mom_mag/data/repositories/sites_repo.dart';
import 'package:mad_mom_mag/data/repositories/users_repo.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/service/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();

  await StorageRepository.getInstance();

  runApp(App(
    apiService: ApiService(),
    articlesApiService: ArticlesApiService(),
    sitesApiService: SitesApiService(),
  ));
}

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.apiService,
      required this.articlesApiService,
      required this.sitesApiService});

  final ApiService apiService;
  final ArticlesApiService articlesApiService;
  final SitesApiService sitesApiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authRepository: getIt.get<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ArticleCubit(articlesRepository: getIt.get<ArticlesRopsitory>()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileCubit(profileRepository: getIt.get<ProfileRepository>()),
        ),
        BlocProvider(
          create: (context) => UserDataCubit(),
        ),
        BlocProvider(
          create: (context) =>
              WebsiteCubit(websiteRepository: getIt.get<SitesRopsitory>()),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RouteNames.splashScreen,
        );
      },
    );
  }
}
