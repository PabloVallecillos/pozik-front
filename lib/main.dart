import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

import 'config/env.dart';
import 'config/firebase/firebase_options.dart';
import 'config/routes.dart';
import 'config/themes.dart';
import 'utils/material/messenger_service.dart';
import 'utils/material/navigator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load();
  await SentryFlutter.init((SentryFlutterOptions options) {
    options.dsn = isProduction ? dotenv.get('SENTRY_DSN') : '';
    options.tracesSampleRate = isProduction ? 0.6 : 1.0;
    options.autoAppStart = false;
    options.attachThreads = true;
    options.enableWindowMetricBreadcrumbs = true;
    options.captureFailedRequests = true;
    options.maxRequestBodySize = MaxRequestBodySize.always;
    options.addIntegration(LoggingIntegration());
  },
  appRunner: () => runApp(
    DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: const MyApp()
    )
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver  {

  late final ValueNotifier<Brightness> _themeModeNotifier = ValueNotifier<Brightness>(Brightness.light);
  late final WidgetsBinding _widgetBinding;
  late final PlatformDispatcher _platform;

  @override
  void initState() {
    _widgetBinding = WidgetsBinding.instance;
    _widgetBinding.addObserver(this);
    _platform = _widgetBinding.platformDispatcher;
    _themeModeNotifier.value = _platform.platformBrightness;
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModeNotifier.value = _platform.platformBrightness;
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Brightness>(
      valueListenable: _themeModeNotifier,
      builder: (BuildContext context, Brightness value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: value == Brightness.dark ? darkTheme : lightTheme,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: messengerKey,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('es', ''),
          ],
          initialRoute: dashboardRoute,
          routes: routes
        );
      }
    );
  }
}
