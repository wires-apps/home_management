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
    this.dialogInfo,
  });

  final BaseStatus status;
  final SnackBarInfo? dialogInfo;

  BaseState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
  }) =>
      BaseState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
      ];
}
