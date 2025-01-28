import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stackfood/core/global/logger/app_logger.dart';
import 'package:stackfood/core/global/network/dio_client.dart';
import 'package:stackfood/features/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:stackfood/features/home/data/datasources/home_datasource.dart';
import 'package:stackfood/features/home/data/datasources/home_datasource_impl.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';

final sl = GetIt.instance;

class ServiceProvider {
  static Future<void> init() async {
    /// Datasource
    await _initDataSources();

    /// Repository
    await _initRepositories();

    /// Bloc
    await _initBlocs();

    /// Logger
    sl.registerLazySingleton(() => AppLogger());

    /// Dio
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioClient(sl.get<Dio>()));
  }
}
