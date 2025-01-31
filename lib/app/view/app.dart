import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection_container.dart';
import '../../features/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';
import '../router/app_router.dart';

/// Starting point of the app.
class App extends StatefulWidget {
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
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
            ),
          );
        },
      );
}
