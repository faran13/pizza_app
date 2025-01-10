import '../../export.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey _myKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        key: _myKey,
        navigatorKey: navigatorKey,
        title: 'Pizza Ordering System',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.initializer,
        builder: (context, widget) {
          final mediaQueryData = MediaQuery.of(context);

          final scale = mediaQueryData.textScaler.clamp(
            minScaleFactor: 0.99,
            maxScaleFactor: 1,
          );
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: scale,
            ),
            child: widget!,
          );
        },
      ),
    );
  }
}
