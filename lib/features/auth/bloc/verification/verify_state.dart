part of 'verify_cubit.dart';

class VerifyState extends BaseState {
  const VerifyState({
    this.device,
    required this.canResend,
    this.counter,
    this.needToGoHomeScreen = false,
    this.isButtonEnabled = false,
    required super.status,
    super.dialogInfo,
  });

  final String? device;
  final int? counter;
  final bool canResend;
  final bool needToGoHomeScreen;
  final bool isButtonEnabled;

  @override
  VerifyState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    String? device,
    int? counter,
    bool? canResend,
    bool? needToGoHomeScreen,
    bool? isButtonEnabled,
  }) =>
      VerifyState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        device: device ?? this.device,
        counter: counter ?? this.counter,
        canResend: canResend ?? this.canResend,
        needToGoHomeScreen: needToGoHomeScreen ?? this.needToGoHomeScreen,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        device,
        counter,
        canResend,
        needToGoHomeScreen,
        isButtonEnabled,
      ];
}
