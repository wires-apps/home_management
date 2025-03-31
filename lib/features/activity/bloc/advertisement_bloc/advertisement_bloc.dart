import 'package:flutter/material.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';

part 'advertisement_event.dart';

part 'advertisement_state.dart';

class AdvertisementBloc extends BaseBloc<AdvertisementEvent, AdvertisementState> {
  AdvertisementBloc()
      : super(
          const AdvertisementState(
            status: BaseStatus.loading,
          ),
        ) {
    // on<LoginPasswordChanged>(_onChangePhoneNumber);
    // on<LoginValidateField>(_onValidField);
    // on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
