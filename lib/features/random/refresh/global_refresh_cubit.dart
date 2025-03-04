import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalRefreshCubit extends Cubit<int> {
  GlobalRefreshCubit() : super(0);

  void refresh() {
    emit(1);
    emit(0);
  }
}
