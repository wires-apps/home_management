part of 'verify_cubit.dart';

class VerifyState extends BaseState {
  const VerifyState({
    this.device,
    required this.canResend,
    this.counter,
    this.needToGoHomeScreen = false,
    required super.status,
    super.dialogInfo,
  });

  final String? device;
  final int? counter;
  final bool canResend;
  final bool needToGoHomeScreen;

  @override
  VerifyState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    String? device,
    int? counter,
    bool? canResend,
    bool? needToGoHomeScreen,
  }) =>
      VerifyState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        device: device ?? this.device,
        counter: counter ?? this.counter,
        canResend: canResend ?? this.canResend,
        needToGoHomeScreen: needToGoHomeScreen ?? this.needToGoHomeScreen,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        device,
        counter,
        canResend,
        needToGoHomeScreen,
      ];
}
