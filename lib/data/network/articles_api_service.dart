import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mad_mom_mag/data/local/shared_prefs.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class ArticlesApiService {
  // DIO SETTINGS

  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ArticlesApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${requestOptions.path}");
          requestOptions.headers
              .addAll({"token": StorageRepository.getString("token")});

          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  //==================================Articles=====================//
  Future<UniversalData> createArticle(
      {required ArticlesModel articlesModel}) async {
    Response response;
    _dio.options.headers = {
      "Accept": "multipart/form-data",
    };
    try {
      response = await _dio.post(
        '/articles',
        data: await articlesModel.getFormData(),
      );
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data["data"]);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateArticle(
      {required ArticlesModel articlesModel, required int id}) async {
    Response response;
    _dio.options.headers = {
      "Accept": "multipart/form-data",
    };
    try {
      response = await _dio.put(
        '/articles/$id',
        data: await articlesModel.getFormData(),
      );
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: response.data["data"]);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getArticles() async {
    Response response;
    try {
      response = await _dio.get(
        '/articles',
      );
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        List<dynamic> articlesData = response.data["data"];
        List<ArticlesModel> articles = articlesData.map((articleJson) {
          return ArticlesModel.fromJson(articleJson);
        }).toList();

        return UniversalData(
          data: articles,
        );
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getArticlesById(int id) async {
    Response response;
    try {
      response = await _dio.get('/articles/$id');

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(
            data: ArticlesModel.fromJson(response.data["data"]));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
