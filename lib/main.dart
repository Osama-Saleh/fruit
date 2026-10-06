import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/utils/get_it.dart';
import 'package:taswek/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/core/helper/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizeAndTranslate.init(
    assetLoader: const AssetLoaderRootBundleJson('assets/lang/'),
    supportedLanguageCodes: <String>['ar', 'en'],
  );

  // Force language to Arabic for now so direction becomes RTL
  await LocalizeAndTranslate.setLocale(const Locale('ar'));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetit();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarThemeData(
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
        ),

        builder: LocalizeAndTranslate.directionBuilder,
        locale: context.locale,
        localizationsDelegates: context.delegates,
        supportedLocales: context.supportedLocales,
        initialRoute: AppRoutes.splashRouteName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
