import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rezult_test/generated/l10n.dart';
import 'package:rezult_test/src/extensions/build_context.dart';
import 'package:rezult_test/src/features/homepage/home_page.dart';
import 'package:rezult_test/src/services/photos_rest.dart';
import 'package:rezult_test/src/services/photos_service_impl.dart';
import 'package:rezult_test/src/theme/theme_manager_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final Dio restApiDioClient = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: {
        "content-type": "application/json",
      },
    ),
  );

  ///REST API Dio
  if (!GetIt.I.isRegistered<PhotosServiceImpl>()) {
    GetIt.I.registerLazySingleton<PhotosServiceImpl>(
      () => PhotosServiceImpl(
        photosRest: PhotosRest(
          restApiDioClient,
        ),
      ),
    );
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeManagerImpl.instance),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: context.lightTheme,
      darkTheme: context.darkTheme,
      highContrastTheme: context.wcagTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        TestLocalization.delegate,
      ],
      supportedLocales: TestLocalization.supportedLocales,
      home: MyHomePage(),
    );
  }
}
