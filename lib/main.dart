import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/constants.dart';
import 'config/themes.dart';
import 'presentation/screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';


void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'kn_IN', basePath: 'i18n', supportedLocales: ["kn_IN"]);
  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  


  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return const ProviderScope(
  //     child: MaterialAppConsumerWidget(),
  //   );
  // }

   @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        locale: localizationDelegate.currentLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        home: const ProviderScope(child:MaterialAppConsumerWidget()),
      ),
    );
  }
}

class MaterialAppConsumerWidget extends ConsumerWidget {
  const MaterialAppConsumerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Homepage(),
    );
  }

 
}
