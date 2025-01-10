import 'package:domain/di/initialize_use_case.dart';
import 'package:flutter/foundation.dart';

import 'export.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      await initializeDependencies();
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: serviceLocator<HomeBloc>()
                ..add(
                  InitPizzaList(),
                ),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      if (kDebugMode) {
        print('error: $error');
      }
    },
  );
}
