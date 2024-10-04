import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reels/core/constants/constants';

@module
abstract class ApiHelper {
  @lazySingleton
  Dio get dio {

    final dio = Dio(

      BaseOptions(

        baseUrl: APIConstants.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
    dio.interceptors.add(
      InterceptorsWrapper(
        // onRequest: (options, handler) async {
        //   final sharedPref = await SharedPreferences.getInstance();
        //   final token = sharedPref.getString(CacheConstants.BearerToken);
        //   final languageCode = sharedPref.getString('language_code') ?? 'en';
        //   options.headers['Accept-Language'] = languageCode;
        //   log('Language Code///////////////////////////////////////////////////: $languageCode');
        //   if (token != null) {
        //     options.headers[APIConstants.BearerTokenKey] = "Bearer $token";
        //     log("   ///////////////////////////////////////////////////////////////////////////////////////////////////////////${token}");
        //   }
        //   return handler.next(options);
        // },
      ),
    );
    return dio;
  }

  // @preResolve
  // Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
