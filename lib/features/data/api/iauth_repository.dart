import 'package:delivery_app/core/core.dart';
import 'package:delivery_app/features/data/dto/client_request.dart';
import 'package:delivery_app/features/data/dto/client_response.dart';
import 'package:delivery_app/features/data/dto/login_request.dart';

abstract class IAuthAPI {
  FutureEither<ClientResponse> addClient(
      {required ClientRequest clientRequest});
  FutureEither<bool> login({required LoginRequest loginRequest});
}
