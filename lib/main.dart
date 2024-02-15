import 'package:delivery_app/router/go_router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return OverlaySupport(
      toastTheme: ToastThemeData(
        alignment: Alignment.topLeft,
        background: const Color(0xFFF518C5),
        textColor: Colors.white,
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(
          //textTheme: GoogleFonts.robotoTextTheme(),
          textTheme: GoogleFonts.poppinsTextTheme(),
          surfaceTint: const Color(0xFFF3FAFF),
          //fontFamily: "GeneralSans",
          useMaterial3ErrorColors: true,
          useMaterial3: true,
          colors: const FlexSchemeColor(
              primary: Color(0xFF6495ED),
              secondary: Color(0xFF273f87),
              error: Color(0xffE23622),
              tertiary: Color(0xFF6A6767)),
          scaffoldBackground: const Color(0xFFFFFFFF),
          background: const Color(0xFFF3FAFF),
        ),
        darkTheme: FlexThemeData.dark(
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3ErrorColors: true,
            useMaterial3: true,
            scheme: FlexScheme.deepBlue),
            themeMode: ThemeMode.light,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
