
import 'package:dio/dio.dart';

// import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logging/logging.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../provider/base_url_provider.dart';


import 'network_service_interceptor.dart';

/// Provide the instance of Dio
final networkServiceProvider = Provider.autoDispose<Dio>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio dio = Dio(options);

  // //Refresh Token Implementation
  // Future<String?> refreshToken() async {
  //   // Perform a request to the refresh token endpoint and return the new access token.
  //   try {
  //     // Attempt to refresh the token and retry the failed request
  //     final refreshToken = AuthService.instance.authUser?.refresh;
  //     Response response = await dio.post(
  //       '/api/v1/auth/jwt/refresh/',
  //       data: {'refresh': refreshToken},
  //     );
  //     Logger("New Token").shout(response.data['access']);

  //     //Get the generated token
  //     final newAccessToken = response.data["access"];
  //     final newRes = {
  //       "access": newAccessToken,
  //       "refresh": refreshToken,
  //     };
  //     //Store the new access token to shared storage
  //     AuthService.instance.login(newRes);
  //     AuthService.instance.load();
  //     return newAccessToken;
  //   } catch (exception) {
  //     debugPrint(
  //       "....Logging Out..... ${true}",
  //     );
  //     AuthService.instance.logout(); // Token refresh failed
  //     return null;
  //   }
  // }
  //Refresh Token Implementation
  // Future<String?> refreshToken() async {
  //   // Perform a request to the refresh token endpoint and return the new access token.
  //   try {
  //     // Attempt to refresh the token and retry the failed request
  //     Response response = await dio.post(
  //       '/api/v1/auth/jwt/refresh/',
  //       data: {'refresh': AuthService.instance.authUser?.refresh},
  //     );
  //     Logger("New Token").shout(response.data['access']);
  //     AuthService.instance.authUser!.access = response.data['access'];
  //     return response.data['access'];
  //   } on DioException catch (_) {
  //     AuthService.instance.logout();
  //     return null; // Token refresh failed
  //   }
  // }

  Future<Response<dynamic>> retry(
      RequestOptions requestOptions, String accessToken) async {
    requestOptions.headers["Authorization"] = "Bearer $accessToken";
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

Future< FormData> uploadImageData(Map<String, dynamic> imageData)async {
    return FormData.fromMap({
      'cover_image': await MultipartFile.fromFile(
        imageData['imageBytes'],
        filename: imageData['filename'],
      ),
      "title": imageData["title"],
      "description": imageData["description"],
      "topic": imageData["topic"],
      "welcome_message": imageData["welcome_message"],
      "has_physical_location": imageData["has_physical_location"],
      "is_public": imageData["is_public"],
      "location_name": imageData["location_name"],
      "lat": imageData["lat"],
      "lon": imageData["lon"],
    });
  }
//  bool isRefreshingToken = false;
  // Add our custom interceptors
  dio.interceptors.addAll([
    // HttpFormatter(),
    NetworkServiceInterceptor(),
    InterceptorsWrapper(onError: (DioException error, handler) async {
      if ((error.response!.statusCode == 401 &&
          error.response?.data["message"] !=
              "No active account found with the given credentials")) {
        // if (AuthService.instance.authUser != null) {
        //   final newAccessToken = await refreshToken();
        //   if (newAccessToken != null) {
        //     RequestOptions origin = error.requestOptions;
        //     if (origin.extra.containsKey('image')) {
        //       origin.data =await
        //          uploadImageData(origin.extra['image']);
        //     }
        //     return handler.resolve(await retry(origin, newAccessToken));
        //   }
        // }
      }
      return handler.next(error);
    }

        // onError: (error, handler) async {
        //   debugPrint(
        //     "....URLPATH..... ${error.requestOptions.path}",
        //   );
        //   debugPrint(
        //     "....StatusCode..... ${error.response?.statusCode}",
        //   );

        //   if (error.response!.statusCode == 401 &&
        //           error.requestOptions.path != Urls.login ||
        //       error.requestOptions.path != Urls.register ||
        //       error.requestOptions.path != Urls.resetPassword) {
        //     final newAccessToken = await refreshToken();

        //     if (newAccessToken != null) {
        //       RequestOptions origin = error.requestOptions;

        //       origin.headers["Authorization"] = "Bearer $newAccessToken";

        //       //Start of add
        //       final Options options = Options(
        //         method: origin.method,
        //         headers: origin.headers,
        //       );
        //       try {
        //         // If the request is a file upload, we need to re-initialize the file

        //         // final Response retryResponse = await dio.request(
        //         //   origin.path,
        //         //   data: origin.data,
        //         //   queryParameters: origin.queryParameters,
        //         //   options: options,
        //         // );
        //         // return handler.resolve(retryResponse);
        //         return handler.resolve(await dio.fetch(error.requestOptions));
        //       } catch (e) {
        //         return handler.next(error);
        //       }

        //       //End of added
        //       //  return handler.resolve(await dio.fetch(error.requestOptions));
        //     }
        //   }

        //   return handler.next(error);
        // },
        // onError: (e, handler) async {
        //   print(" PATH !!!${e.requestOptions.path} !!!!!!!!");
        //   if (e.response?.statusCode == 401 &&
        //           e.requestOptions.path != Urls.login ||
        //       e.requestOptions.path != Urls.register ||
        //       e.requestOptions.path != Urls.resetPassword) {
        //     if (!isRefreshingToken) {
        //       isRefreshingToken = true;
        //       try {
        //         String? newAccessToken = await refreshToken();
        //         if (newAccessToken != null) {
        //           // Update the request header with the new access token
        //           e.requestOptions.headers['Authorization'] =
        //               'Bearer $newAccessToken';
        //           var auth = AuthService.instance.authUser;
        //           print("OLD ACCESS ${auth!.access} ??????????");
        //           auth.access = newAccessToken;
        //           print("NEW ACCESS ${auth.access} ?????????");
        //           final newRes = {
        //             "access": auth.access,
        //             "refresh": auth.refresh,
        //           };
        //           AuthService.instance.login(newRes);
        //           // Repeat the request with the updated header
        //           return handler.resolve(await dio.fetch(e.requestOptions));
        //         } else {
        //           AuthService.instance.logout();
        //         }
        //       } catch (e) {
        //         AuthService.instance.logout();
        //       } finally {
        //         isRefreshingToken = false;
        //       }
        //     } else {
        //       // Wait for the ongoing token refresh and then retry the request
        //       await Future.delayed(const Duration(seconds: 5));
        //       return handler.resolve(await dio.fetch(e.requestOptions));
        //     }
        //   }
        //   return handler.next(e);
        // },
        ),

    // RetryInterceptor(
    //   dio: dio,
    //   logPrint: print, // specify log function (optional)
    //   retries: 3, // retry count (optional)
    //   retryDelays: const [
    //     // set delays between retries (optional)
    //     Duration(seconds: 1), // wait 1 sec before first retry
    //     Duration(seconds: 2), // wait 2 sec before second retry
    //     Duration(seconds: 3), // wait 3 sec before third retry
    //   ],
    // ),

    if (kDebugMode)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
  ]);

  return dio;
});
