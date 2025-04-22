import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/public_utilities/models/debt_single_response.dart';
import 'package:home_management/features/public_utilities/repository/utility_bills_remote_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'single_utility_bills_event.dart';

part 'single_utility_bills_state.dart';

class SingleUtilityBillsBloc extends BaseBloc<SingleUtilityBillsEvent, SingleUtilityBillsState> {
  SingleUtilityBillsBloc(this._repository)
      : super(
          const SingleUtilityBillsState(
            status: BaseStatus.success,
          ),
        ) {
    on<LoadUtilityBillsById>(_onLoadSingleUtilityBills);
    on<OpenWindowPayment>(_openWindowPayment);
  }

  final UtilityBillsRemoteRepository _repository;

  Future<void> _onLoadSingleUtilityBills(
    LoadUtilityBillsById event,
    Emitter<SingleUtilityBillsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getSingleUtilityBills(id: event.id);

    response.fold(
      (l) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(l),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: BaseStatus.success,
          debt: r,
        ),
      ),
    );
  }

  Future<void> _openWindowPayment(
    OpenWindowPayment event,
    Emitter<SingleUtilityBillsState> emit,
  ) async {
    final deeplink = state.debt?.data.deepLink;

    if (deeplink == null) return;
    final Uri uri = Uri.parse(deeplink);
    String storeUrl = '';
    try {
      await launchUrl(uri);
    } catch (e) {
      if (Platform.isAndroid) {
        storeUrl = 'https://play.google.com/store/apps/details?id=kz.kaspi.mobile'; // URL для Android
      } else if (Platform.isIOS) {
        storeUrl = 'https://apps.apple.com/us/app/kaspi/id123456789'; // URL для iOS (замени на реальный ID приложения)
      }
      await launchUrl(Uri.parse(storeUrl));
    }
  }
}
