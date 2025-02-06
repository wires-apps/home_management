part of 'base_bloc.dart';

enum BaseStatus {
  success,
  loading,
  failure;

  bool get isFailure => this == BaseStatus.failure;
  bool get isSuccess => this == BaseStatus.success;
  bool get isLoading => this == BaseStatus.loading;
}

class BaseState extends Equatable {
  const BaseState({
    required this.status,
    // this.snackBarInfo,
  });

  final BaseStatus status;
  // final SnackBarInfo? snackBarInfo;

  BaseState copyWith({
    BaseStatus? status,
    // SnackBarInfo? snackBarInfo,
  }) =>
      BaseState(
        status: status ?? this.status,
        // snackBarInfo: snackBarInfo,
      );

  @override
  List<Object?> get props => [status/*, snackBarInfo*/];
}
