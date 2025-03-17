import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';

part 'base_event.dart';

part 'base_state.dart';

class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}
