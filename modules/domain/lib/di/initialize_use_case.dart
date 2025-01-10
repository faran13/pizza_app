import '../../../../export.dart';

GetIt serviceLocator = GetIt.instance;
Future<void> initializeDomainLayerDependencies() async {
  await recaptchaUseCase();
}

Future<void> recaptchaUseCase() async {
  serviceLocator.registerLazySingleton<HomeScreenUseCase>(
    () => HomeScreenUseCase(),
  );
}
