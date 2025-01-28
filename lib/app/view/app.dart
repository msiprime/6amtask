import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection_container.dart';
import '../../features/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';
import '../router/app_router.dart';
import 'global_keys.dart';

/// The root widget of the application.
///
/// This widget sets up the BLoC providers, routing, theming, and localization
/// for the entire app. It also handles connectivity status.
class App extends StatefulWidget {
  /// Creates a [App].
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AppMetaDataCubit>(
                create: (context) => sl.get<AppMetaDataCubit>(),
              ),
            ],
            child: MaterialApp.router(
              // theme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              builder: (context, routerWidget) => Builder(
                builder: (context) {
                  var result = routerWidget!;
                  result = Scaffold(
                    key: globalScaffoldKey,
                    resizeToAvoidBottomInset: false,
                    body: result,
                  );

                  return result;
                },
              ),
            ),
          );
        },
      );
}
