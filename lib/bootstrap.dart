import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stackfood/core/global/observer/bloc_observer.dart';

import 'app/view/app.dart';
import 'core/di/injection_container.dart';
import 'core/global/logger/logger.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializes dependency injection
  await ServiceProvider.init();

  /// Logs errors on console
  FlutterError.onError = (details) {
    logF(details.exceptionAsString(), stackTrace: details.stack);
  };

  /// Logs all bloc events and states
  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}
