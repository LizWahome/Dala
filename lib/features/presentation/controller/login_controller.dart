import 'package:delivery_app/common/extension/pop_ups.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/core/provider/is_internet_connected_provider.dart';
import 'package:delivery_app/features/data/api/auth_api_provider.dart';
import 'package:delivery_app/features/data/dto/login_request.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final userIdProvider = StateProvider<int>((ref) => 0);

final loginControllerProvider =
    StateNotifierProvider<LoginController, bool>((ref) {
  final connectivity = ref.watch(isInternetConnectedProvider);
  final authAPI = ref.watch(authAPIProvider);
  return LoginController(
      authAPI: authAPI, ref: ref, connectivity: connectivity);
});

class LoginController extends StateNotifier<bool> {
  LoginController(
      {required AuthAPI authAPI,
      required Ref ref,
      required InternetConnectionObserver connectivity})
      : _authAPI = authAPI,
        _ref = ref,
        _connectivity = connectivity,
        super(false);
  final AuthAPI _authAPI;
  final Ref _ref;
  final InternetConnectionObserver _connectivity;

  void login(
      {required BuildContext context,
      required LoginRequest loginRequest,
      int? userID}) async {
    final connection = await _connectivity.isNetConnected();
    if (connection) {
      state = true;
      final res = await _authAPI.login(loginRequest: loginRequest);
      state = false;

      res.fold((l) {
        context.showSnackBar(l.message, color: context.errorColor);
      }, (r) {
        context.showToast("Welcome back");
        context.goNamed(AppRoutes.dashboard.name);
      });
    } else {
      context.showSnackBar("No Interne!!!", color: context.errorColor);
    }
  }
}
