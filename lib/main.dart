import 'dart:convert';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

import 'config/colors.dart';
import 'config/env.dart';
import 'config/firebase/firebase_options.dart';
import 'config/router.dart';
import 'config/themes.dart';
import 'providers/providers.dart';
import 'repositories/user.dart';
import 'utils/material/messenger_service.dart';
import 'utils/storage/token_storage.dart';

final FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  final String? payload = notificationResponse.payload;
  if (payload != null) {
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await dotenv.load();
  final List<SingleChildWidget> providers = <SingleChildWidget>[
    ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) => UserProvider()
    ),
    ChangeNotifierProvider<NavigationProvider>(
      create: (BuildContext context) => NavigationProvider()
    ),
  ];
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
    MultiProvider(
      providers: providers,
      child: DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: const MyApp()
      ),
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

  late GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  void onTapNotification(String? payload) {
    if (payload != null) {
      if (context.read<UserProvider>().isSignedIn()) {
      } else {
      }
    }
  }

  Future<void> onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title.toString()),
        content: Text(body.toString()),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              onTapNotification(payload);
            },
          )
        ],
      ),
    );
  }

  void _handleFirebaseDynamicLinks(PendingDynamicLinkData? pendingDynamicLinkData) {
    if (pendingDynamicLinkData != null) {
      final Uri link = pendingDynamicLinkData.link;
      // if (link.queryParameters.containsKey('vc') && link.queryParameters.containsKey('email')) {
      //   _navigatorKey.currentState?.push(
      //     MaterialPageRoute<void>(builder: (BuildContext context) => NewPasswordPage(
      //       email: link.queryParameters['email'],
      //       vc: link.queryParameters['vc'],
      //     ),),
      //   );
      // }
      // goToPage(payload: link.queryParameters, navigatorKey: dashboardNavigatorKeys[dashboardRoute]);
    }
  }

  @override
  void initState() {
    /// light/dark theme
    _widgetBinding = WidgetsBinding.instance;
    _widgetBinding.addObserver(this);
    _platform = _widgetBinding.platformDispatcher;
    _themeModeNotifier.value = _platform.platformBrightness;
    /// light/dark theme
    /// notification push
    const AndroidInitializationSettings iAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings iOs = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final InitializationSettings iSettings = InitializationSettings(android: iAndroid, iOS: iOs);
    /// notification push
    /// navigator and scaffold service keys
    setState(() {
      _scaffoldMessengerKey = messengerKey;
    });
    /// navigator and scaffold service keys
    /// flutter local notifications
    fln.initialize(
      iSettings,
      // onSelectNotification: onTapNotification
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        final String? payload = notificationResponse.payload;
        onTapNotification(payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    /// flutter local notifications
    /// fcm
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Foreground notification
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = notification?.android;
      if (notification != null && android != null) {
        fln.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'ic_stat_name',
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
      // Foreground notification
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) async {
      // On tap notification
    });
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fcm.requestPermission().then((NotificationSettings ns) async {
        if (
          ns.authorizationStatus == AuthorizationStatus.authorized
          || ns.authorizationStatus == AuthorizationStatus.provisional
        ) {
          final String? authToken = await TokenStorage().get();
          if (authToken != null) {
            fcm.getToken().then((String? tok) async {
              await UserRepository().editProfileMetaData(<String, String?>{'fcm_token': tok});
            });
            fcm.onTokenRefresh.listen((String tok) async {
              await UserRepository().editProfileMetaData(<String, String?>{'fcm_token': tok});
            });
          }
        }
      });
    });

    FirebaseDynamicLinks.instance.getInitialLink().then(_handleFirebaseDynamicLinks);
    FirebaseDynamicLinks.instance.onLink.listen(_handleFirebaseDynamicLinks);
    /// fcm
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
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: value == Brightness.dark ? darkTheme : lightTheme,
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
          color: primaryLight,
        );
      }
    );
  }
}
