// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:delivery_app/core/services/shared_service.dart';
import 'package:delivery_app/features/data/dto/login_response.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:go_router/go_router.dart';

class AuthService {
  LoginResponse? authUser;
  bool? viewed;

  static AuthService instance = AuthService();

  login(Map<String, dynamic> userMap) async {
    authUser = LoginResponse.fromJson(userMap);

    await setPreference('authUser', jsonEncode(authUser));
  }

  view(bool seen) async {
    viewed = seen;

    await storeBool('view', seen);
  }

  Future isViewed() async {
    bool? seen = await getBool("view");
    if (seen == null) {
      return false;
    }
    viewed = seen;
    return true;
  }

  Future load() async {
    String? userString = await getPreference('authUser');
    if (userString == null) {
      return false;
    }
    authUser = LoginResponse.fromJson(jsonDecode(userString));

    return true;
  }

  Future logout() async {
    authUser = null;
    await removePreference("view");
    await removePreference('authUser');

    rootNavigator.currentState!.context.goNamed(AppRoutes.login.name);
  }
}
