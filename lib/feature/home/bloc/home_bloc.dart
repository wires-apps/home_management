import 'package:flutter/material.dart';
import 'package:home_management/core/bloc/base_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(const HomeState(
          status: BaseStatus.loading,
        )) {
    // on<LoginPasswordChanged>(_onChangePhoneNumber);
    // on<LoginValidateField>(_onValidField);
    // on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

}
