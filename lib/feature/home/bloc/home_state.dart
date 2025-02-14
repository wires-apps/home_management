part of 'home_bloc.dart';

class HomeState extends BaseState {
  const HomeState({
    this.needToCloseDialog = false,
    required super.status,
  });

  final bool needToCloseDialog;

  @override
  HomeState copyWith({BaseStatus? status, bool? needToCloseDialog}) => HomeState(
        status: status ?? this.status,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
      ];
}
