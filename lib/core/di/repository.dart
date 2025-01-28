part of 'injection_container.dart';

Future<void> _initRepositories() async {
  sl.registerFactory(
    () => HomeRepositoryImpl(
      homeDataSource: sl.get<HomeDataSourceImpl>(),
    ),
  );
}
