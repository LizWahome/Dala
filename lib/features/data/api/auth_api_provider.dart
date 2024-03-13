import 'package:delivery_app/common/urls.dart';
import 'package:delivery_app/core/failure/dio_exception.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/core/remote/network_service.dart';
import 'package:delivery_app/core/services/auth_service.dart';
import 'package:delivery_app/core/type_def.dart';
import 'package:delivery_app/features/data/api/iauth_repository.dart';
import 'package:delivery_app/features/data/dto/client_request.dart';
import 'package:delivery_app/features/data/dto/client_response.dart';
import 'package:delivery_app/features/data/dto/login_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authAPIProvider = Provider<AuthAPI>((ref) {
  final dio = ref.read(networkServiceProvider);
  return AuthAPI(dio: dio);
});

class AuthAPI implements IAuthAPI {
  final Dio _dio;
  AuthAPI({required Dio dio}) : _dio = dio;

  @override
  FutureEither<ClientResponse> addClient(
      {required ClientRequest clientRequest}) async {
    try {
      final res = await _dio.post("https://bnb.nanesoft-lab.com/apis/users/", data: {
        "email": clientRequest.email,
        "username": clientRequest.username,
        "first_name": clientRequest.firstName,
        "last_name": clientRequest.lastName,
        "phone": clientRequest.phone,
        "role": clientRequest.role,
        "gender": clientRequest.gender,
        // "is_active": clientRequest.isActive,
        "password": clientRequest.password,
        "confirm_password": clientRequest.confirmPassword,
        "id_number": clientRequest.idNumber
      });
      return right(ClientResponse.fromJson(res.data));
    } on DioException catch (e, s) {
      final errorMessage = DioExceptions.fromDioError(e);
      return left(Failure(message: errorMessage.toString(), stackTrace: s));
    } catch (e, s) {
      return left(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  FutureEither<bool> login({required LoginRequest loginRequest}) async {
    try {
      final res = await _dio.post(Urls.login, data: {
        "email_or_phone_or_username": loginRequest.emailOrPhoneOrUsername,
        "password": loginRequest.password
      });
      AuthService.instance.login(res.data);
      return right(true);
    } on DioException catch (e, s) {
      final errorMessage = DioExceptions.fromDioError(e);
      return left(Failure(
          message: errorMessage.toString(),
          stackTrace: s,
          statusCode: e.response!.statusCode));
    } catch (e, s) {
      return left(Failure(message: e.toString(), stackTrace: s));
    }
  }
}
