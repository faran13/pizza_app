import 'package:domain/di/export.dart';
import 'package:domain/domain/export.dart';
import 'package:pizza_app/export.dart';

Future<void> initializeBlocs() async {
  serviceLocator.registerLazySingleton(
    () => HomeBloc(
      homeScreenUseCase: serviceLocator<HomeScreenUseCase>(),
    ),
  );
}
