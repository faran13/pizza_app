import 'package:domain/di/export.dart';

import 'di_bloc.dart';

Future<void> initializeDependencies() async {
  await Future.wait(
    [
      initializeDomainLayerDependencies(),
      initializeBlocs(),
    ],
  );
}
