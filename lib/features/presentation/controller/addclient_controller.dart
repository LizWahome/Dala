// ignore_for_file: use_build_context_synchronously

import 'package:delivery_app/common/extension/pop_ups.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/core/provider/is_internet_connected_provider.dart';
import 'package:delivery_app/features/data/api/auth_api_provider.dart';
import 'package:delivery_app/features/data/dto/client_request.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final registerGlobalKey =
    Provider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final registerControllerProvider =
    StateNotifierProvider.autoDispose<ClientController, bool>((ref) {
  final connectivity = ref.watch(isInternetConnectedProvider);
  final authAPI = ref.watch(authAPIProvider);
  return ClientController(
      authAPI: authAPI, connectivity: connectivity, ref: ref);
});

class ClientController extends StateNotifier<bool> {
  ClientController(
      {required AuthAPI authAPI,
      required InternetConnectionObserver connectivity,
      required Ref ref})
      : _authAPI = authAPI,
        _connectivity = connectivity,
        _ref = ref,
        super(false);
        final AuthAPI _authAPI;
  final InternetConnectionObserver _connectivity;
  final Ref _ref;

  void addClient(
      {required BuildContext context,
      required ClientRequest clientRequest}) async {
    final connection = await _connectivity.isNetConnected();
    if (connection) {
      state = true;
      final res = await _authAPI.addClient(clientRequest: clientRequest);
      state = false;
      res.fold((l) {
        context.showSnackBar(l.message, color: context.errorColor);
      }, (r) {
        context.showToast("Register successful ${r.firstName}");
        context.goNamed(AppRoutes.dashboard.name);
        print(r.email);
      });
    } else {
      context.showSnackBar("No Internet!!!", color: context.errorColor);
    }
  }

  bool validateSave() {
    final form = _ref.read(registerGlobalKey).currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
