import 'package:flutter/material.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';

part 'voting_event.dart';

part 'voting_state.dart';

class VotingBloc extends BaseBloc<VotingEvent, VotingState> {
  VotingBloc()
      : super(
          const VotingState(
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
