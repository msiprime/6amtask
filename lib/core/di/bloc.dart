part of 'injection_container.dart';

Future<void> _initBlocs() async {
  sl.registerLazySingleton(() => AppMetaDataCubit(sl()));
}
