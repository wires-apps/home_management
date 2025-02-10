import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';

class BaseCubit<State extends BaseState> extends Cubit<State> {
  BaseCubit(super.initialState);
}
